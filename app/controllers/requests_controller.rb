class RequestsController < ApplicationController
  def create
    @costume = Costume.find(params[:costume_id])
    @request = Request.new(request_params)
    @request.costume = @costume
    @request.user = current_user
    if @request.save
      respond_to do |format|
        format.html { redirect_to @costume, notice: 'Request was successfully created.' }
        format.js   # This will look for create.js.erb or use a no-content response
        end
    else
      render 'create', status: :unprocessable_entity, notice: "request failed"
    end
  end

  def index
    @requests = Request.all
  end

  def destroy
  end

  private

  def request_params
    params.require(:request).permit(:start_date, :end_date)
  end
end
