class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_cycle, only: [:new, :create, :show, :edit, :update, :search]
  before_action :set_review, only: [:show, :edit, :update, :destroy, :move_to_index]
  before_action :move_to_index, only: [:edit, :destroy]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @review.comments.includes(:user)
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @review.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def search
    @reviews = Review.search(params[:keyword])
  end

  def set_cycle
    @cycle = Cycle.find(params[:cycle_id])
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def move_to_index
    redirect_to root_path unless current_user.id == @review.user_id
  end

  private

  def review_params
    params.require(:review).permit(:title, :detail, :area_id, :rate).merge(user_id: current_user.id, cycle_id: params[:cycle_id])
  end
end
