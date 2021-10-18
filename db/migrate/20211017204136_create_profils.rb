class CreateProfils < ActiveRecord::Migration[6.1]
  def change
    create_table :profils do |t|
      t.string :name
      t.text :bio
      t.string :telephone
      t.integer :status
      t.string :document
      t.integer :doc_type
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
