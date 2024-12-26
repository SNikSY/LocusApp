class AddLikesCountToTopics < ActiveRecord::Migration[7.2]
  def change
    add_column :topics, :likes_count, :integer
  end
end
