class AddPasswordDigestToArtisans < ActiveRecord::Migration[7.1]
  def change
    add_column :artisans, :password_digest, :string
  end
end
