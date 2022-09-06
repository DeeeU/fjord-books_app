# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.with_attached_avatar.order(:id).page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def followings
    @following_users = current_user.following_user
  end

  def followers
    @follower_users = current_user.follower_user
  end
end
