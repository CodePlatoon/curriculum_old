class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :manufacturer, null: false
      t.string :model, null: false
      t.string :category, null: false
      t.text :description
      t.integer :price_cents, null: false, default: 0
      t.float :rating, null: false, default: 0

      t.integer :volume_discount_percent
      t.integer :volume_discount_threshold
      t.string :color

      t.timestamps
    end

    add_index :products, :model, unique: true
  end
end
