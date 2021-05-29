class Question < ApplicationRecord
  validates :content, presence: true, length: { maximum: 255 }
  validates :status, inclusion: { in: [true, false] }
  
  belongs_to :user
  has_many :choices
  has_many :votes
  has_many :answers, through: :votes, source: :user
  has_many :survey, through: :votes, source: :choice
end
