class AddColumnsToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :product_name, :string
    add_column :orders, :cart_total, :float
    add_column :orders, :buyer, :string
  end
end
