class RenameStoryExperienceTypeToFeelingType < ActiveRecord::Migration[6.0]
  def change
    rename_column :stories, :experience_type, :feeling_type
  end
end
