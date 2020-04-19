class GamesController < ApplicationController
  before_action :load_game, only: :show

  def new
    @game = Game.new
  end

  def show
  end

  def create
    game = GameService.create_game(**game_params)
    redirect_to game_path(game)
  end

  private

  def game_params
    params
      .require(:game)
      .permit(:game_id, :player_one, :player_two)
      .to_h
      .symbolize_keys
  end

  def load_game
    @game ||= Game.find_by(game_id: params[:game_id])
  end
end
