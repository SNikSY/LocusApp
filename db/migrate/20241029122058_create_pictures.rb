class CreatePictures < ActiveRecord::Migration[7.2]
  def change
    create_table :pictures do |t|
      t.string :attachment_id
      t.integer :post_id
      t.string :file_url

      t.timestamps
    end
  end
end
