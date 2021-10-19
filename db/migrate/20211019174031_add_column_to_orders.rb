class AddColumnToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :cart_product_id, :integer
  end
end
