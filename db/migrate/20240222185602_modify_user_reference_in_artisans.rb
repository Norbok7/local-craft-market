class ModifyUserReferenceInArtisans < ActiveRecord::Migration[7.1]
  def change
    change_column_null :artisans, :user_id, true
  end
end