class Netflix < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :release_year, presence: true, length: { is: 4 }
  validates :duration, :description, :genre, presence: true
end
