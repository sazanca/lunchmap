class LikesController < ApplicationController
  before_action :set_variables

  def like
    like = current_user.likes.new(shop_id: @shop.id)
    like.save
  end

  def unlike
    like = current_user.likes.find_by(shop_id: @shop.id)
    like.destroy
  end

  private
  
  def set_variables
    @shop = Shop.find(params[:shop_id])
    @id_name = "#like-link-#{@shop.id}"
  end
end
