class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.string :category
      t.decimal :price
      t.integer :quantity
      t.string :image_url
      t.references :artisan, null: false, foreign_key: true

      t.timestamps
    end
  end
end
