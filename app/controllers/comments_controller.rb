# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_comment, only: %i[edit update destroy]
  before_action :regular_user, only: %i[edit update destroy]

  def edit; end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to polymorphic_path(@comment.postable), notice: 'コメントの投稿が成功しました'
    else
      redirect_to polymorphic_path(@comment.postable), alert: 'コメントの投稿が失敗しました'
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to polymorphic_path(@comment.postable)
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to polymorphic_path(@comment.postable), notice: t('controllers.common.notice_destroy', name: Comment.model_name.human)
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:text, :postable_type, :postable_id)
  end

  def regular_user
    @comment = Comment.find(params[:id])
    return unless @comment.user.id != current_user.id

    redirect_to polymorphic_path(@comment.postable.class)
  end
end
