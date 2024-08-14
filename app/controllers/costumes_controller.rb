class CostumesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
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
