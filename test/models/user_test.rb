# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test '#name_or_email' do
    user = User.new(email: 'aiueo@example.com', name: '')
    assert_equal 'aiueo@example.com', user.name_or_email

    user.name = 'Yamada'
    assert_equal 'Yamada', user.name_or_email
  end

  test '#follow_and_unfollow' do
    user1 = User.create!(email: 'user1@example.com', password: 'user1pass')
    user2 = User.create!(email: 'user2@example.com', password: 'user2pass')
    user1.follow(user2)
    assert user1.following?(user2)
    assert user2.followed_by?(user1)

    user1.unfollow(user2)
    assert_equal false, user1.following?(user2)
    assert_equal false, user2.followed_by?(user1)
  end
end
