class ReviewsController < ApplicationController

  def index

  end

  def new
    @user = User.find(params[:user_id])
    @review = Review.new
  end

  def create
    Review.create(create_params)
  end


  private
  def create_params
    params.require(:review).permit(:rate, :text).merge(to_user_id: params[:user_id], from_user_id: current_user.id)
  end
end
