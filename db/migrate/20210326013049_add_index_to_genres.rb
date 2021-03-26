class AddIndexToGenres < ActiveRecord::Migration[5.2]
  def change
    add_index :genres, :name, unique: true
  end

  def up
    change_column :genres, :name, :string, null: false, unique: true
  end

  def down
    change_column :genres, :name, :string, null: false
  end
end
