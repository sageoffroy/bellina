class CreateWayPays < ActiveRecord::Migration[5.2]
  def change
    create_table :way_pays do |t|
      t.string :name
      t.float :c1
      t.float :c2
      t.float :c3
      t.float :c4
      t.float :c5
      t.float :c6
      t.float :c7
      t.float :c8
      t.float :c9
      t.float :c10
      t.float :c11
      t.float :c12
      t.float :c13
      t.float :c14
      t.float :c15
      t.float :c16
      t.float :c17
      t.float :c18

      t.timestamps
    end
  end
end
