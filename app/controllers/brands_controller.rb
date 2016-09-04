class BrandsController < ApplicationController

  before_action :set_player
  before_action :set_brand, only: [:show, :edit, :update, :destroy]

  def index
    @brands = @player.brands
    [@player, @brands]
  end

  def new
    @brand = @player.brands.build
  end

  def show
    @brand = set_brand
  end


  def create
    @brand = @player.brands.build(brand_param)

    if @brand.save
      flash[:notice] = 'brand created successfully'
      redirect_to [@player, @brand]
    else
      flash[:alert] = 'error in brand creation'
      redirect_to new
    end

  end

  def edit
    @player = set_player
    @brand = set_brand
    [@player, @brand]
  end

  def update
    @player = set_player
    @brand = set_brand
    @brand.update(brand_param)

    redirect_to player_brands_path(@player)
  end


  private

  def set_player
    @player = Player.find(params[:player_id])
  end

  def set_brand
    @player.brands.find(params[:id])
  end

  def brand_param
    params.require(:brand).permit(:name, :description, :attachment)
  end

end