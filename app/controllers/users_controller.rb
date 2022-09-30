# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.with_attached_avatar.order(:id).page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def followings
    @follow = current_user.following_user.with_attached_avatar
  end

  def followers
    @follow = current_user.follower_user.with_attached_avatar
  end
end
