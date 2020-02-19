class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.integer :dni, :limit => 8
      t.string :fullname
      t.string :mail
      t.string :telephone
      t.string :address
      t.boolean :avanzar

      t.timestamps
    end
  end
end
