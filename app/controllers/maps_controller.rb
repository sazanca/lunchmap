class MapsController < ApplicationController
  
  def index
    # このあとで@mapに関するフォームを作るので、Mapインスタンスを作っておきます(でないとエラーになる)
    @map = Map.new
    @maps = Map.all
  end

  def create
    @map = Map.new(map_params)
    if @map.save
      redirect_to maps_url
    else
      @maps = Map.all
    end
  end

  private
  def map_params
    params.require(:map).permit(:latitude, :longitude,shop_attributes: [:address] )
  end
end
