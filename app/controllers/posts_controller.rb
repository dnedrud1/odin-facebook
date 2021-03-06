class PostsController < ApplicationController
  before_filter :authenticate_user!
  
  def create
    @user = current_user
    @user_posts = @user.posts.all.sort_by { |p| p.created_at }.reverse
    
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to current_user
    else
      redirect_to request.referrer || root_url, :flash => { :error => @post.errors.full_messages.join(", ") }
    end
  end
  
  def destroy
    @post = current_user.posts.find_by(id: params[:id])
    @post.destroy
    redirect_to request.referrer || root_url
  end
  
  private
  
    def post_params
      params.require(:post).permit(:content)
    end
end
