class Choice < ApplicationRecord
  validates :content, length: { maximum: 30 }
  validates_presence_of :question

  belongs_to :question
  has_many :votes
  has_many :survey, through: :votes, source: :question
end
