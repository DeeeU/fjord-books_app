# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_comment, only: %i[show update destroy]
  before_action :regular_user, only: %i[show update destroy]

  def show; end

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
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to polymorphic_path(@comment.postable) }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to polymorphic_path(@comment.postable), notice: t('controllers.common.notice_destroy', name: Comment.model_name.human) }
      format.json { head :no_content }
    end
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
