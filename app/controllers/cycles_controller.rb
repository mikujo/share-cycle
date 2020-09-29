class CyclesController < ApplicationController
  def index
    @cycle = Cycle.all
  end
end
