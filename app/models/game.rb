class Game < ApplicationRecord
  serialize :game_state

  validates :game_id,     uniqueness: true, presence: true
  validates :game_state,  presence: true

  # Game State
  # {
  #   game_id: <string>,
  #   player_one: {
  #     name: <string>,
  #     army: <Army>
  #   },
  #   player_two: {
  #     name: <string>,
  #     army: <Army>
  #   },
  #   current_player: <string>,
  #   opposing_player: <string>,
  #   turn_result: <string>
  # }

  def to_param
    game_id
  end

  def player_one
    game_state&.dig(:player_one, :name)
  end

  def player_two
    game_state&.dig(:player_two, :name)
  end

  def player_one_hand
    game_state&.dig(:player_one, :army)&.cards || []
  end

  def player_two_hand
    game_state&.dig(:player_two, :army)&.cards || []
  end

  def current_player
    game_state&.dig(game_state&.dig(:current_player).to_sym, :name)
  end

  def opposing_player
    game_state&.dig(game_state&.dig(:opposing_player).to_sym, :name)
  end

  def turn_result
    game_state&.dig(:turn_result)
  end
end
