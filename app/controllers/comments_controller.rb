# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :regular_comment, only: %i[edit update destroy]

  def edit; end

  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_to polymorphic_path(@comment.postable), notice: t('controllers.common.notice_create', name: Comment.model_name.human)
    else
      redirect_to polymorphic_path(@comment.postable), alert: t('controllers.common.notice_no_create', name: Comment.model_name.human)
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

  def comment_params
    params.require(:comment).permit(:text, :postable_type, :postable_id)
  end

  def regular_comment
    @comment = current_user.comments.find(params[:id])
  end
end
