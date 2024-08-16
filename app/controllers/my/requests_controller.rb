class My::RequestsController < ApplicationController
  def index
    @requests = current_user.requests_as_owner
    @pending_requests = @requests.pending
    @accepted_requests = @requests.accepted
    @declined_requests = @requests.declined
    @completed_requests = @requests.completed

    if params[:status].present?
      @requests= @requests.where(status: params[:status])
    end
  end

end
