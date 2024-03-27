class AddUserTypeToArtisans < ActiveRecord::Migration[7.1]
  def change
    add_column :artisans, :userType, :string
  end
end
