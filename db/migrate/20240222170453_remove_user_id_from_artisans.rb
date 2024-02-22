class RemoveUserIdFromArtisans < ActiveRecord::Migration[7.1]
  def change
    remove_column :artisans, :user_id, :integer
  end
end
