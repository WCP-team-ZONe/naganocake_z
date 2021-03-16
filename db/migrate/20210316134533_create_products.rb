class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|

      t.timestamps
      t.integer :genre_id
      t.string :name, null: false
      t.text :description, null: false
      t.integer :ex_price, null: false
      t.string :image_id, null: false
      t.boolean :is_active, null: false, default: 'true'
      
    end
  end
end
