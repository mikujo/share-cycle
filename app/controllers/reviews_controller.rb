class ReviewsController < ApplicationController
  before_action :set_cycle, only: [:new, :create, :show, :edit, :update]
  before_action :set_review, only: [:show, :edit, :update, :destroy]

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

  def set_cycle
    @cycle = Cycle.find(params[:cycle_id])
  end

  def set_review
    @review = Review.find(params[:id])
  end

  private

  def review_params
    params.require(:review).permit(:title, :detail, :area_id, :rate).merge(user_id: current_user.id, cycle_id: params[:cycle_id])
  end
end
