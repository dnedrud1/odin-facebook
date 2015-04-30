class RequestsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    current_user.request_friend(@user)
    flash[:success] = "Friend request sent!"
    redirect_to @user
  end
end
