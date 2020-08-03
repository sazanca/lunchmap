class UsersController < ApplicationController
  def show
    @user = User.find(params[:id] )
    @shops = @user.shops
  end
end
