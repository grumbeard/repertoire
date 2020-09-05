class ChangeStoriesPhotos < ActiveRecord::Migration[6.0]
  def up
    change_column :stories, :photos, :string, array: true, default: [], using: "(string_to_array(photos, ','))"
  end

  def down
    change_column :stories, :photos, :string, array: false, default: nil, using: "(array_to_string(photos, ','))"
  end
end
