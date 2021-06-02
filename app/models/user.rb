class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: { case_sensitive: false }
  has_secure_password
  
  has_many :questions
  has_many :votes
  has_many :answers, through: :votes, source: :question  
  
  def vote(choice)
    self.votes.find_or_create_by(user_id: @current_user, question_id: @question, choice_id: @choice)
  end

  def vote?(user_id: @current_user, question_id: @question, choice_id: @choice)
    self.votes.include?(user_id: @current_user, question_id: @question, choice_id: @choice)
  end
end
