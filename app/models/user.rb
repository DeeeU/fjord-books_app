# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many :follower, class_name: 'Follow', foreign_key: 'follower_id', dependent: :destroy, inverse_of: 'follower'
  has_many :followed, class_name: 'Follow', foreign_key: 'followed_id', dependent: :destroy, inverse_of: 'followed'
  has_many :following_user, through: :follower, source: :followed
  has_many :follower_user, through: :followed, source: :follower

  def follow(user_id)
    follower.create(followed_id: user_id)
  end

  def unfollow(user_id)
    follower.find_by(followed_id: user_id)&.destroy
  end

  def following?(user)
    following_user.include?(user)
  end
end
