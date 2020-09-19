class ShopsController < ApplicationController
  before_action :set_shop, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, except: [:index, :show, :search]
  
  def index
    @shops = Shop.includes(:user,:tags).order('created_at DESC').page(params[:page]).per(5)
    @tags = Shop.tag_counts_on(:tags)
    @maps = Map.all
    gon.maps = Map.all    
    if params[:tag_name]
      @shops = Shop.tagged_with("##{params[:tag_name]}")
      @shops = Shop.page(params[:page]).per(5)
    end
    
    def rule
    end
  end

  def new
    @shop = Shop.new
    @shop.build_map
  end

  def create
    @shop = Shop.new(shop_params)
    respond_to do |format|
      if @shop.save
        format.html { redirect_to @shop, notice: '登録成功' }
        format.json { render :show, status: :created, location: @shop }
      else
        flash.now[:error] ="登録出来ませんでした"
        format.html { render :new }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /shops/1
  # GET /shops/1.json
  def show
    @shop = Shop.find(params[:id])
    @comment = Comment.new
    @comments = @shop.comments.includes(:user)
    @coupons = Coupon.where(is_valid: '有効').limit(5).order("created_at DESC")
    @map = Map.find(params[:id])
    @lat = @shop.map.latitude
    @lng = @shop.map.longitude
    gon.lat = @lat
    gon.lng = @lng
  end
  
  
  # GET /shops/1/edit
  def edit
    @shop = Shop.find(params[:id])
  end

  # PATCH/PUT /shops/1
  # PATCH/PUT /shops/1.json
  def update
    respond_to do |format|
      shop = Shop.find(params[:id])
      if @shop.update(shop_params)
        format.html { redirect_to @shop, notice: 'Shop was successfully updated.' }
        format.json { render :show, status: :ok, location: @shop }
      else
        format.html { render :edit }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shops/1
  # DELETE /shops/1.json
  def destroy
    @shop.destroy
    respond_to do |format|
      format.html { redirect_to shops_url, notice: 'Shop was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_shop
    @shop = Shop.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
  
  # Only allow a list of trusted parameters through.
  def shop_params
    params.require(:shop).permit(:name, :arrivaltime, :ganre, :price, :text, :tag_list, map_attributes: [:id, :address]).merge(user_id: current_user.id)
  end
end
