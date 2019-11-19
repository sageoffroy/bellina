class CreateProviders < ActiveRecord::Migration[5.2]
  def change
    create_table :providers do |t|
      t.string :name
      t.string :note
      t.integer :cuil, :limit => 8
      t.string :telephone
      t.string :email

      t.timestamps
    end
  end
end
