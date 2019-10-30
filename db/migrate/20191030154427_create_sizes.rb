class CreateSizes < ActiveRecord::Migration[5.2]
  def change
    create_table :sizes do |t|
      t.integer :number
      t.decimal :us
      t.decimal :cms

      t.timestamps
    end
  end
end
