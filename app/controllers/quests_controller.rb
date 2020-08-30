class QuestsController < ApplicationController
  before_action :load_game

  def new
  end

  def show
  end

  def create
  end

  def update
  end

  private

  def load_game
    @game ||= Game.find_by(game_id: params[:game_game_id])
  end
end
