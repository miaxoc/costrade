class ReviewsController < ApplicationController

  def new
    @request = params[:request_id]
    @review = Review.new
  end

  def create
    @request = Request.find(params[:request_id])
    @review = Review.new(review_params)
    @review.user = current_user
    @review.request= @request
    if @review.save
      redirect_to costume_path(@request.costume)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def update
  end

  def destroy
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
