class PostsController < ApplicationController
  before_filter :authenticate_user!
  
  def create
    @user = current_user
    @user_posts = @user.posts.all.sort_by { |p| p.created_at }.reverse
    
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to current_user
    else
      render :template => "users/show"
    end
  end
  
  private
  
    def post_params
      params.require(:post).permit(:content)
    end
end
