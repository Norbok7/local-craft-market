class AddPasswordToArtisans < ActiveRecord::Migration[7.1]
  def change
    add_column :artisans, :password, :string
  end
end
