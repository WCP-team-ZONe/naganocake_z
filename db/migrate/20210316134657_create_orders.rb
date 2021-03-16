class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|

      t.timestamps
      t.integer :member_id
      t.integer :postage, null: false
      t.string :postal_code, null: false
      t.string :address, null: false
      t.string :name, null: false
      t.integer :paymant, null: false, default:0
      t.integer :total_price, null: false
      t.integer :order_status, null: false, default:0

    end
  end
end
