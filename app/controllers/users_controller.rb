class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @shops = @user.shops
    @profile = Profile.find(params[:id])
    # @profile = Profile.includes(:user)
  end

  def create
    profile = Profile.create(profile_params)
    redirect_to "/users/#{profile.user.id}"
  end

  private
  def profile_params
    params.require(:profile).permit(:name,:ganre).merge(user_id: current_user.id)
  end
end
