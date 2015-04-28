class UsersController < ApplicationController
  before_filter :authenticate_user!#, :except => [:show, :index]
  
  def show
    @post  = current_user.posts.build
    @user = User.find(params[:id])
    @user_posts = @user.posts.all.sort_by { |p| p.created_at }.reverse
    
  end
  
  def index
    @users = User.all
  end
end
