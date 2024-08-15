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

    # respond_to do |format|

      # if @request.save
        # format.html { redirect_to costume_path(@costume) }
        # format.json { redirect_to costume_path(@costume) } # Follows the classic Rails flow and look for a create.json view
      # else
      #   format.html { render "requests/new", status: :unprocessable_entity }
      #   format.json # Follows the classic Rails flow and look for a create.json view
      # end
    # end
  end

  def index
    @requests = Request.where(user: current_user)
    @pending_requests = Request.where(user: current_user, status: 0)
    @accepted_requests = Request.where(user: current_user, status: 1)
    @declined_requests = Request.where(user: current_user, status: 2)
    @completed_requests = Request.where(user: current_user, status: 3)
  end

  def destroy
    @request = Request.find(params[:id])
    @request.destroy
    redirect_to request_path(@request), status: :see_other
  end

  private

  def request_params
    params.require(:request).permit(:start_date, :end_date)
  end
end
