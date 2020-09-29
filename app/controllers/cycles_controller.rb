class CyclesController < ApplicationController
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

  private

  def cycle_params
    params.require(:cycle).permit(:image, :name, :detail, :price)
  end
end
