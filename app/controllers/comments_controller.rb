class CommentsController < ApplicationController
  def create
    @cycle = Cycle.find(params[:cycle_id])
    @review = Review.find(params[:review_id])
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to cycle_review_path(cycle_id: @cycle.id, id: @review.id)
    else
      redirect_to cycle_review_path(cycle_id: @cycle.id, id: @review.id)
    end
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, review_id: params[:review_id])
  end
end