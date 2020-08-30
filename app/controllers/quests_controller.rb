class QuestsController < ApplicationController
  before_action :load_game

  def new
  end

  def show
    @quest = Quest.all.detect { |q| q[:quest] == params[:id] }
  end

  def create
    game.set_current_quest(quest_id: quest_id)
    redirect_to game_quest_path(game, quest_id)
  end

  def update
  end

  private

  attr_reader :game

  def quest_id
    @quest_id ||= params.require(:quest).permit(:quest_id)[:quest_id]
  end

  def load_game
    @game ||= Game.find_by(game_id: params[:game_game_id])
  end
end
