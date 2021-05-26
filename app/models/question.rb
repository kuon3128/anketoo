class Question < ApplicationRecord
  belongs_to :user
  validates :content, presence: true, length: { maximum: 255 }
  validates :status, inclusion: { in: [true, false] }
end
