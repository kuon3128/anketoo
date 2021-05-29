class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: { case_sensitive: false }
  has_secure_password
  
  has_many :questions
  has_many :votes
  has_many :answers, through: :votes, source: :question  
  
  def vote(choice)
    unless self == choice.question.user
      @vote = Vote.create(user_id: @current_user, question_id: choice.question_id, choice_id: choice)
    end
  end

end
