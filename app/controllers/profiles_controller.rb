class ProfilesController < ApplicationController

  def show
    # @profile = Profile.new
    # @profile = @user.profile
    @profiles = Profile.includes(:user)
  end

  def create
    profile = Profile.create(profile_params)
    redirect_to "/users/#{profile.user.id}" 
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  private
  def profile_params
    params.permit(:name, :ganre).merge(user_id: current_user.id)
  end
end
