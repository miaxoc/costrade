class RequestsController < ApplicationController
  def create
    @costume = Costume.find(params[:costume_id])
    @request = Request.new(request_params)
    @request.costume = @costume
    @request.user = current_user

    if @request.save
      redirect_to requests_path
    else
      render 'requests/form', status: :unprocessable_entity
    end
  end

  def index
    @requests = current_user.requests
    @pending_requests = Request.where(user: current_user, status: 0)
    @accepted_requests = Request.where(user: current_user, status: 1)
    @declined_requests = Request.where(user: current_user, status: 2)
    @completed_requests = Request.where(user: current_user, status: 3)
    @my_requests = current_user.requests_as_owner

    if params[:status].present?
      @requests= @requests.where(status: params[:status])
    end
  end

  def update
    @request = Request.find(params[:id])
    if @request.update(request_params)
      redirect_to my_requests_path
    else
      render 'requests/form', status: :unprocessable_entity
    end
  end

  def destroy
    @request = Request.find(params[:id])
    @request.destroy
    redirect_to request_path(@request), status: :see_other
  end

  private

  def request_params
    params.require(:request).permit(:start_date, :end_date, :status)
  end
end
