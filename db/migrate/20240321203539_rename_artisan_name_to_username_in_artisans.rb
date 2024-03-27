class RenameArtisanNameToUsernameInArtisans < ActiveRecord::Migration[7.1]
  def change
    rename_column :artisans, :artisan_name, :username
  end
end
