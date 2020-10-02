class CyclesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :user_admin, only: [:new, :edit, :destroy]
  before_action :set_cycle, only: [:show, :edit, :update, :destroy]

  def index
    @cycle = Cycle.all
  end

  def new
    @cycle = Cycle.new
  end

  def create
    @cycle = Cycle.new(cycle_params)
    if @cycle.save
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
    if @cycle.update(cycle_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @cycle.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def user_admin
    redirect_to root_path unless current_user.admin == true
  end

  def set_cycle
    @cycle = Cycle.find(params[:id])
  end

  private

  def cycle_params
    params.require(:cycle).permit(:image, :name, :detail, :price)
  end
end
