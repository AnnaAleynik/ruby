class Task < ApplicationRecord
  belongs_to :card
  validates :title, presence: true, length: { minimum: 2 }

  scope :actual, -> { where('created_at > ?', Date.today - 1.month) }
  # 1.month, 1.day to show how it work

  before_save :upcase_title

  private 

  def upcase_title
    self.title = title.upcase
  end
end
