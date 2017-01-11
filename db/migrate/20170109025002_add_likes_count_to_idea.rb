class AddLikesCountToIdea < ActiveRecord::Migration[5.0]
  def change
  	add_column :ideas, :likes_count, :integer, :default => 0
  end
end
