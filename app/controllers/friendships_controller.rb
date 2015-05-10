class FriendshipsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @friends = current_user.friends.paginate(page: params[:page])
  end
  
  def create
    current_user.create_friendship(User.find(params[:requestor_id]))
    @request = Request.find(params[:request_id])
    @request.destroy
    flash[:success] = "Friendship created!"
    redirect_to requests_path
  end
end