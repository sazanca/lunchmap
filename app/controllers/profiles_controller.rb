class ProfilesController < ApplicationController

  def show
    # @profile = Profile.find(params[:id])
    @profiles = Profile.includes(:user)
    # @profile = @user.profile
  end

  def create
    profile = Profile.create(profile_params)
    redirect_to "/users/#{profile.user.id}" 
  end

  private
  
  def profile_params
    params.require(:profile).permit(:name, :ganre).merge(user_id: current_user.id)
  end
end
