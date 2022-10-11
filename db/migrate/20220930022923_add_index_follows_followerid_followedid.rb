class AddIndexFollowsFolloweridFollowedid < ActiveRecord::Migration[6.1]
  def change
    add_index :follows, [:follower_id, :followed_id], unique: true
  end
end
