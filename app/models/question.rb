class Question < ApplicationRecord
  validates :content, presence: true, length: { maximum: 255 }
  validates :status, inclusion: { in: [true, false] }
  
  belongs_to :user
  has_many :choices, dependent: :destroy
  has_many :votes
  has_many :answers, through: :votes, source: :user
  has_many :survey, through: :votes, source: :choice
  
  accepts_nested_attributes_for :choices
end
