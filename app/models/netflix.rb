class Netflix < ApplicationRecord
    validates :title, presence: true, uniqueness: true
    validates :release_year, :duration, :description, presence: true

end
