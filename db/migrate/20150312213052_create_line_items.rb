class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.references :item, index: true
      t.references :order, index: true
      t.integer :quantity

      t.timestamps null: false
    end
    add_foreign_key :line_items, :items
    add_foreign_key :line_items, :orders
  end
end
