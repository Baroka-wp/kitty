class UpdateProfilsForeignKey < ActiveRecord::Migration[6.1]
  def change
    # remove the old foreign_key
    remove_foreign_key :profils, :users

    # add the new foreign_key
    add_foreign_key :profils, :users, null: true, on_delete: :cascade
  end
end
