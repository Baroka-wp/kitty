class AddColumnSellerToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :seller_id, :integer
  end
end
