class AddForeignKeyConstraintToArtisans < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :artisans, :users
  end
end
