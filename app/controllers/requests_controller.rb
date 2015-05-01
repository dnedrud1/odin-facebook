class RequestsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @requests = current_user.friend_requests
  end
  
  def create
    @user = User.find(params[:user_id])
    current_user.request_friend(@user)
    flash[:success] = "Friend request sent!"
    redirect_to @user
  end
  
  def destroy
    @request = Request.find(params[:id])
    @request.destroy
    redirect_to requests_path
  end
end
