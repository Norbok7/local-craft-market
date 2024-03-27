class RemoveUnwantedFieldsFromArtisans < ActiveRecord::Migration[7.1]
  def change
    remove_column :artisans, :artisan_bio
    remove_column :artisans, :location
    remove_column :artisans, :profile_picture
    remove_column :artisans, :user_id
  end
end
