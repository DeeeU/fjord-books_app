# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test '#name_or_email' do
    user = users(:alice)
    assert_equal "alice", user.name_or_email
    user.name = ""
    assert_equal 'alice@hoge.com', user.name_or_email
  end

  test '#follow_and_unfollow' do
    alice = users(:alice)
    bob = users(:bob)
    alice.follow(bob)
    assert alice.following?(bob)
    assert bob.followed_by?(alice)

    alice.unfollow(bob)
    assert_not alice.following?(bob)
    assert_not bob.followed_by?(alice)
  end
end
