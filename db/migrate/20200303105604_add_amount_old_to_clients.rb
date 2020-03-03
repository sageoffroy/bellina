class AddAmountOldToClients < ActiveRecord::Migration[5.2]
  def change
    add_column :clients, :amount_old, :decimal, precision: 8, scale: 2
  end
end
