class RequestsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create, :index]
  def create
    @costume = Costume.find(params[:costume_id] || params[:id])
    @request = Request.new(request_params)
    @request.costume = costume
    @request.user = current_user.id
  end

  def index
  end

  def destroy
  end

  private

  def request_params
    params.require(:request).permit(:start_date, :end_date)
  end
end
