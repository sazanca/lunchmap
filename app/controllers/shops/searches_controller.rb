class Shops::SearchesController < ApplicationController
  def index
    if params[:keyword]
      @shops = Shop.where('name LIKE (?)', "%#{params[:keyword]}%")
    else
      flash.now[:alert] = '検索結果該当無しです'
    end
  end
end
