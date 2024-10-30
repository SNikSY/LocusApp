class CreateTopics < ActiveRecord::Migration[7.2]
  def change
    create_table :topics do |t|
      t.string :title
      t.text :description
      t.integer :creator_user_id
      t.integer :location_id
      t.integer :category_id

      t.timestamps
    end
  end
end
