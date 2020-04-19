class AttackService

  attr_reader :game, :attacker, :defender

  def self.attack(game_id:, attacker:, defender:)
    new(game_id: game_id, attacker: attacker, defender: defender).attack!
  end

  def initialize(game_id:, attacker:, defender:)
    @game     = Game.find_by(game_id: game_id)
    @attacker = game.send("#{game.game_state[:current_player]}_hand".to_sym).detect { |w| w.warrior_name == attacker }
    @defender = game.send("#{game.game_state[:opposing_player]}_hand".to_sym).detect { |w| w.warrior_name == defender }
  end

  def attack!
    attacker_died = false
    defender_died = false

    attacker_score = (1..attacker.attack).to_a.sample
    defender_score = (1..defender.defense).to_a.sample

    if defender_score >= attacker_score
      attacker.attack -= 1
      outcome = "lost to"
      if attacker.attack == 0
        game.send("#{game.game_state[:current_player]}_hand".to_sym).delete(attacker)
        attacker_died = true
      end
    else
      defender.defense -= 1
      outcome = "defeated"
      if defender.defense == 0
        game.send("#{game.game_state[:opposing_player]}_hand".to_sym).delete(defender)
        defender_died = true
      end
    end

    game.game_state[:turn_result] = "#{attacker.warrior_name} #{outcome} #{defender.warrior_name} #{attacker_score} to #{defender_score}."

    if attacker_died
      game.game_state[:turn_result] += "<br/>#{attacker.warrior_name} has died and is no longer available in #{@game.current_player}'s army."
    end

    if defender_died
      game.game_state[:turn_result] += "<br/>#{defender.warrior_name} has died and is no longer available in #{@game.opposing_player}'s army."
    end

    if game.game_state[:current_player] == "player_one"
      game.game_state[:current_player]  = "player_two"
      game.game_state[:opposing_player] = "player_one"
    else
      game.game_state[:current_player]  = "player_one"
      game.game_state[:opposing_player] = "player_two"
    end

    game.save!
  end
end
