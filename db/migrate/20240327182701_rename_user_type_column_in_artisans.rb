class RenameUserTypeColumnInArtisans < ActiveRecord::Migration[7.1]
  def change
    rename_column :artisans, :userType, :user_type
  end
end
