class CreateSales < ActiveRecord::Migration[5.2]
  def change
    create_table :sales do |t|
      t.date :date_sale
      t.references :client, foreign_key: true
      t.string :state

      t.timestamps
    end
  end
end
