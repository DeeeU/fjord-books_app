class CommentsController < ApplicationController
  before_action :set_comment, only: %i[show edit update destroy]
  def index
    @comments = Comment.order(:id)
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to reports_path(@postable), info: '成功'
    else
      redirect_to reports_path(@postable), alert: '失敗'
    end
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:text, :postable_type, :postable_id)
  end
end
