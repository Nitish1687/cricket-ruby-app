class PlayersController < ApplicationController

  def index
    @players = Player.all
  end

  def new
    @player = Player.new
  end

  def show
    @player = Player.find(params[:id])
  end

  def create

    @player = Player.new(player_params)

    if @player.save
      flash[:notice] = "player successfully saved"
      redirect_to @player
    else
      flash.now[:alert] = "enter valid data"
      render "new"
    end

  end

  def edit
    @player = Player.find(params[:id])
  end


  def update
    @orignal_player = Player.find(params[:id])

    @orignal_player.update(player_params)

    redirect_to @orignal_player
  end

  def destroy
    @player = Player.find(params[:id])
    @player.destroy
    redirect_to players_url
  end

  private

  def player_params
    params.require(:player).permit(:name, :age, :description)
  end


end
