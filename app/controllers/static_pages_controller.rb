class StaticPagesController < ApplicationController
  def home
    @group_posts = current_user.feed if user_signed_in?
  end
end
