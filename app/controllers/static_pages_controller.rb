class StaticPagesController < ApplicationController
  def home
    @group_posts = current_user.feed.paginate(page: params[:page]).order('created_at DESC') if user_signed_in?
  end
end
