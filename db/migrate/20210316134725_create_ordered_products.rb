class CreateOrderedProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :ordered_products do |t|

      t.timestamps
      t.integer :product_id
      t.integer :order_id
      t.integer :quantity, null: false
      t.integer :purchased_price, null: false
      t.integer :production_status, null: false, default:0

    end
  end
end
