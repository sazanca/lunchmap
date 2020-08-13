class ShopsController < ApplicationController
  before_action :set_shop, only: [:show, :edit, :update, :destroy]

  # GET /shops
  # GET /shops.json
  def index
    # @tag = params[:tag]
    # @shops = Shop.tagged_with("#{params[:tag]}")
    @shops = Shop.all.order('created_at DESC')
    @tags = Shop.tag_counts_on(:tags)
    if params[:name_key]
      @shops = Shop.where('name LIKE ?', "%#{params[:name_key]}%")
    else
      @shops = Shop.all
    end
    # if params[:tag_list]
    #   @tags = Shop.tagged_with("#{params[:tag_list]}")
    # end
  end

  # GET /shops/1
  # GET /shops/1.json
  def show
    @shop = Shop.find(params[:id])
    @comment = Comment.new
    @comments = @shop.comments.includes(:user)
  end

  # GET /shops/new
  def new
    @shop = Shop.new
  end

  # GET /shops/1/edit
  def edit
  end

  # POST /shops
  # POST /shops.json
  def create
    @shop = Shop.new(shop_params)
    respond_to do |format|
      if @shop.save
        format.html { redirect_to @shop, notice: 'Shop was successfully created.' }
        format.json { render :show, status: :created, location: @shop }
      else
        format.html { render :new }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
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
  
  # Only allow a list of trusted parameters through.
  def shop_params
    params.require(:shop).permit(:name, :address, :arrivaltime, :ganre, :price, :text, :tag_list).merge(user_id: current_user.id)
  end
end
