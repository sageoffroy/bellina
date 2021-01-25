class AddOrderToWayPays < ActiveRecord::Migration[5.2]
  def change
    add_column :way_pays, :order, :integer
  end
end
