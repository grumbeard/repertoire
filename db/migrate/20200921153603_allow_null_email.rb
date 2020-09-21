class AllowNullEmail < ActiveRecord::Migration[6.0]
  def up
    remove_index :users, :email
    change_column :users, :email, :string, null: true
    add_index :users, :username, unique: true
  end
  def down
    remove_index :users, :username
    change_column :users, :email, :string, null: false
    add_index :users, :email, unique: true
  end
end
