class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_cycle, only: [:create, :destroy]
  before_action :set_review, only: [:create, :destroy]
  before_action :set_comment, only: [:destroy, :move_to_index]
  before_action :move_to_index, only: [:destroy]

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to cycle_review_path(cycle_id: @cycle.id, id: @review.id)
    else
      redirect_to cycle_review_path(cycle_id: @cycle.id, id: @review.id)
    end
  end

  def destroy
    if @comment.destroy
      redirect_to cycle_review_path(cycle_id: @cycle.id, id: @review.id)
    else
      redirect_to cycle_review_path(cycle_id: @cycle.id, id: @review.id)
    end
  end

  def set_cycle
    @cycle = Cycle.find(params[:cycle_id])
  end

  def set_review
    @review = Review.find(params[:review_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end


  def move_to_index
    redirect_to root_path unless current_user.id == @comment.user_id
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, review_id: params[:review_id])
  end
end