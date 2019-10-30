class CreateReleaseCountries < ActiveRecord::Migration[5.2]
  def change
    create_table :release_countries do |t|
      t.string :code
      t.string :name

      t.timestamps
    end
  end
end
