class Choice < ApplicationRecord
  belongs_to :question
  validates :content, presence: true, length: { maximum: 30 }
end
