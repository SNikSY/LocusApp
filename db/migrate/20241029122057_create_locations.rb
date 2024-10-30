class CreateLocations < ActiveRecord::Migration[7.2]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :region
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps
    end
  end
end
