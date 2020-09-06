class RemovePhotosFromStories < ActiveRecord::Migration[6.0]
  def change
    remove_column :stories, :photos, :string
  end
end
