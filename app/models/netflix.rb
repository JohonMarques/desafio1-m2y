require 'csv'
class Netflix < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :release_year, presence: true, length: { is: 4 }
  validates :duration, :description, :genre, presence: true

  csv_text = File.read(Rails.root.join('lib', 'seeds', 'netflix_titles.csv'))
  csv = CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1')
  csv.each do |row|
    t = Netflix.new
    t.show_id = row['show_id'] if t.show_id.present?
    t.genre = row['type']
    t.title = row['title']
    t.director = row['director'] if t.director.present?
    t.cast = row['cast'] if t.cast.present?
    t.country = row['country'] if t.country.present?
    t.date_added = row['date_added'] if t.date_added.present?
    t.release_year = row['release_year']
    t.rating = row['rating'] if t.rating.present?
    t.duration = row['duration']
    t.listed_in = row['listed_in'] if t.listed_in.present?
    t.description = row['description']
    t.save
  end
end
