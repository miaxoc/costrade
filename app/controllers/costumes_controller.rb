class CostumesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    if params[:query].present?
      @costumes = Costume.search_by_title_and_description(params[:query])
    else
      @costumes = Costume.all
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @costume = Costume.new
  end

  def create
    @costume = Costume.new(costume_params)
    @costume.user = current_user
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
