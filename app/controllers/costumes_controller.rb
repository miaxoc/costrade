class CostumesController < ApplicationController

  def index
    @costumes = Costume.all
  end

  def new
  end

  def create
  end

  def show
    @costume = Costume.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
