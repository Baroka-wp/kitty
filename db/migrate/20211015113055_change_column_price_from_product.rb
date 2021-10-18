class ChangeColumnPriceFromProduct < ActiveRecord::Migration[6.1]
  def change
    change_column :products, :price, :float
  end
end
