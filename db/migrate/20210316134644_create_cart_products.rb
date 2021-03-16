class CreateCartProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_products do |t|

      t.timestamps
      t.integer :member_id
      t.integer :product_id
      t.integer :quantity, null: false


    end
  end
end
