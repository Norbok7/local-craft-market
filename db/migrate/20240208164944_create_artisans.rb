class CreateArtisans < ActiveRecord::Migration[7.1]
  def change
    create_table :artisans do |t|
      t.string :artisan_name
      t.text :artisan_bio
      t.string :location
      t.string :profile_picture
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
