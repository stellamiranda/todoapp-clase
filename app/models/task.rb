class Task < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :description, length: { maximum: 280 }
end
