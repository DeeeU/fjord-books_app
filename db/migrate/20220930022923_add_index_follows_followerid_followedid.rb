class AddIndexFollowsFolloweridFollowedid < ActiveRecord::Migration[6.1]
  def change
    add_index :Follows, [:follower_id, :followed_id]
  end
end
