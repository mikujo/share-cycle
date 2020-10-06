class ReviewsController < ApplicationController
  before_action :set_cycle
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

  def set_cycle
    @cycle = Cycle.find(params[:cycle_id])
  end

    private

    def review_params
      params.require(:review).permit(:title, :detail, :area_id, :rate).merge(user_id: current_user.id, cycle_id: params[:cycle_id])
    end
  
end
