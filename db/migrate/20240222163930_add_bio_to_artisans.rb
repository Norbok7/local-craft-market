class AddBioToArtisans < ActiveRecord::Migration[7.1]
  def change
    add_column :artisans, :bio, :string
  end
end
