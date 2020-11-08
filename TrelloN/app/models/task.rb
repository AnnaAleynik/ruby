class Task < ApplicationRecord
	belongs_to :card
	validates :title, presence: true, length: { minimum: 2}
end
