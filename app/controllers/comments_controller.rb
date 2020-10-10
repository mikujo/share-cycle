class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to  cycle_review_path(comment.review.id)
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, review_id: params[:review_id])
  end

end