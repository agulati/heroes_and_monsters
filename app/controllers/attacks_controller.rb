class AttacksController < ApplicationController
  def create
    AttackService.attack(**attack_params)
    redirect_to game_path(params[:game_game_id])
  end

  private

  def attack_params
    params
      .require(:attack)
      .permit(:attacker, :defender)
      .to_h
      .symbolize_keys
      .merge({ game_id: params[:game_game_id] })
  end
end
