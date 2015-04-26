class LikesController < ApplicationController
  before_filter :authenticate_user!
  
  def create
    @like = current_user.likes.build(post_id: params[:post_id])

    @like.save
    redirect_to request.referrer || root_url
  end
  
  def destroy
    @like = current_user.likes.find_by(id: params[:id])
    @like.destroy
    redirect_to request.referrer || root_url
  end
  
  private

end
