class CreatePaymentDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :payment_details do |t|
      t.references :payment
      t.references :way_pay, foreign_key: true
      t.integer :fee
      t.decimal :amount, precision: 8, scale: 2
      t.decimal :real_amount, precision: 8, scale: 2
      t.timestamps
    end
  end
end
