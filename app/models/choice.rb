class Choice < ApplicationRecord
  validates :content, presence: true, length: { maximum: 30 }
  
  belongs_to :question
  has_many :votes
  has_many :survey, through: :votes, source: :question
end
