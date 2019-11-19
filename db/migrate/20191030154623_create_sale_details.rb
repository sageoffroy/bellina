class CreateSaleDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :sale_details do |t|
      t.references :sale, foreign_key: true
      t.references :footwear, foreign_key: true
      t.integer :count
      t.decimal :real_price, precision: 8, scale: 2
      
      t.timestamps
    end
  end
end
