class Card < ApplicationRecord
  has_many :tasks, dependent: :destroy
  validates :title, presence: true, length: { minimum: 2 }

  scope :actual, -> { where('created_at > ?', Date.today - 1.day) }
  # 1.month, 1.day to show how it work
end
