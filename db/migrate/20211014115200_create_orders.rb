class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false
      t.string :adresse, null: false
      t.integer :status, null: false
      t.integer :cart_id, null: false

      t.timestamps
    end
  end
end
