class AddUserIdToArtisans < ActiveRecord::Migration[7.1]
  def change
    add_reference :artisans, :user, foreign_key: true
  end
end
