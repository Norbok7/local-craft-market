class UpdateArtisanBioValidation < ActiveRecord::Migration[7.1]
  def change
    change_column :artisans, :bio, :string, null: true
  end
end
