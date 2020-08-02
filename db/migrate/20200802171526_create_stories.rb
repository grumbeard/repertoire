class CreateStories < ActiveRecord::Migration[6.0]
  def change
    create_table :stories do |t|
      t.string :title
      t.string :photos
      t.decimal :longitude, precision: 18, scale: 15
      t.decimal :latitude, precision: 18, scale: 15
      t.integer :price_rating
      t.boolean :worth_it
      t.string :mood_type
      t.string :experience_type
      t.string :ambience_type

      t.timestamps
    end
  end
end
