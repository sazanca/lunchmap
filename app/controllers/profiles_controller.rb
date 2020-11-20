class ProfilesController < ApplicationController
  # before_action :set_profile, only: [:show, :edit, :update, :destroy]


  def show
    # @profile = @user.profile
    # @user = User.find(params[:id])
    @profiles = Profile.includes(:user)
  end

  def create
    profile = Profile.create(profile_params)
    redirect_to "/users/#{profile.user.id}" 
  end

  def edit
    @profiles = Profile.find(params[:id])
  end
  
  private

  # def set_profile
  #   @profile = Profile.find(params[:id])
  # end

  def profile_params
    params.require(:profile).permit(:name,:ganre).merge(user_id: current_user.id)
  end
end
