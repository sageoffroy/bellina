class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.date :payment_date
      t.references :client, foreign_key: true

      t.timestamps
    end
  end
end
