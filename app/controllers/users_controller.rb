class UsersController < ApplicationController

  def index
    
  end
  def show
    @user = User.find(params[:id])
    @shops = @user.shops
    @profile = Profile.new(id: current_user.id)
    @profile = @user.profile
    # @profile = Profile.find(params[:id])
    # @profile = @user.profile.includes(:user)
  end

  def create
    profile = Profile.create(profile_params)
    redirect_to "/users/#{profile.user.id}"
  end

  private
  # def set_user
  #   @user = User.find(params[:id])
  # end

  def profile_params
    params.require(:profile).permit(:name,:ganre).merge(user_id: current_user.id)
  end
end
