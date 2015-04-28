class CommentsController < ApplicationController
  before_filter :authenticate_user!
  
  def create
    @comment = current_user.comments.build(comment_params)
    
    if @comment.save
      redirect_to request.referrer || root_url
    else
      prior_page = Rails.application.routes.recognize_path(request.referrer)
      render '#{prior_page[:controller]}/#{prior_page[:action]}'
    end
  end
  
  private
  
    def comment_params
      params.require(:comment).permit(:content, :post_id)
    end
end
