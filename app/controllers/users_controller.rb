class UsersController < ApplicationController
  before_filter :authenticate_user!#, :except => [:show, :index]
  
  def show
    @post  = current_user.posts.build
    @user = User.find(params[:id])
    @user_posts = @user.posts.paginate(page: params[:page]).order('created_at DESC')
    
  end
  
  def index
    @users = User.paginate(page: params[:page])
  end
end
