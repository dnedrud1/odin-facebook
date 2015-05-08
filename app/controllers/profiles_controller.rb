class ProfilesController < ApplicationController
  before_filter :authenticate_user!
  before_action :correct_user,   only: :edit
  
  def edit
    @user = User.find(params[:id])
    @profile = @user.profile ? @user.profile : @user.build_profile
  end
  
  def create
    @profile = current_user.build_profile(profile_params)
    if @profile.save
      redirect_to current_user
    else
      render 'edit'
    end
  end
  
  def update
    @profile = current_user.profile
    if @profile.update_attributes(profile_params)
      redirect_to current_user
    else
      render 'edit'
    end
  end
  
  private
  
    def profile_params
      params.require(:profile).permit(:birthday, :home_city, :gender, :relationship_status)
    end
    
    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user == @user
    end
    
end
