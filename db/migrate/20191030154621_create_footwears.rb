class CreateFootwears < ActiveRecord::Migration[5.2]
  def change
    create_table :footwears do |t|
      t.string :sku
      t.references :trademark, foreign_key: true
      t.references :category, foreign_key: true
      t.references :color, foreign_key: true
      t.integer :stock
      t.integer :stock_warning
      t.decimal :wholesale_price, precision: 8, scale: 2
      t.decimal :retail_price, precision: 8, scale: 2
      t.string :gender
      t.boolean :active
      t.string :short_description
      t.string :long_description
      t.date :release_date
      t.references :release_country, foreign_key: true
      t.references :size, foreign_key: true
      t.string :weight
      t.references :season, foreign_key: true

      t.timestamps
    end
  end
end
