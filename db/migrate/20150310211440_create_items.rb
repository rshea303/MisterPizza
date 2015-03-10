class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.integer :price
      t.string :description
      t.references :category, index: true
      t.string :image_file_name

      t.timestamps null: false
    end
    add_foreign_key :items, :categories
  end
end
