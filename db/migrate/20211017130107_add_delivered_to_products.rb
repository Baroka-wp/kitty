class AddDeliveredToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :delivered, :integer
  end
end
