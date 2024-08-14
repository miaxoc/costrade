class RequestsController < ApplicationController
  def create
    @costume = Costume.find(params[:costume_id])
    @request = Request.new(request_params)
    @request.costume = @costume
    @request.user = current_user
    if @request.save
      redirect_to costume_path(@costume, notice: "request made!")
    else
      render 'create', status: :unprocessable_entity, notice: "request failed"
    end
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
