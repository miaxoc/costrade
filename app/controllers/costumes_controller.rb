class CostumesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @costumes = Costume.all
  end

  def new
    @costume = Costume.new
  end

  def create
    @costume = Costume.new(costume_params)
    if @costume.save
      redirect_to costume_path(@costume)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def show
    @costume = Costume.find(params[:id])
    @request = Request.new
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def costume_params
    params.require(:costume).permit(:title, :description, :size, :price, :category, photos: [])
  end

end
