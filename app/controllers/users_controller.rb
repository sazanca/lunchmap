class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    # @profile = Profile.new#(id: current_user.id)
    @profile = @user.profile
    # @profile = Profile.find(params[:id])
  end

  def create
    profile = Profile.create(profile_params)
    redirect_to "/users/#{profile.user.id}"
    @profile = Profile.new#(id: current_user.id)
    @profile = @user.profile
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  # def profile_params
  #   params.require(:profile).permit(:name,:ganre).merge(user_id: current_user.id)
  # end
end
