class RenamePaymantColumnToOrders < ActiveRecord::Migration[5.2]
  def change
    rename_column :orders, :paymant, :payment
  end
end
