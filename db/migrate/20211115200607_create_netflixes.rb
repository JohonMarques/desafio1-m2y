class CreateNetflixes < ActiveRecord::Migration[6.1]
  def change
    create_table :netflixes do |t|
      t.string :show_id
      t.string :type
      t.string :title
      t.string :director
      t.text :cast
      t.string :country
      t.string :date_added
      t.string :release_year
      t.string :rating
      t.string :duration
      t.string :listed_in
      t.text :description

      t.timestamps
    end
  end
end
