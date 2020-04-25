class GameService

  attr_reader :game_id, :player_one, :player_two

  def self.create_game (game_id:, player_one:, player_two:)
    new(game_id: game_id, player_one: player_one, player_two: player_two).create!
  end

  def initialize (game_id:, player_one:, player_two:)
    @game_id    = game_id
    @player_one = player_one
    @player_two = player_two
  end

  def create!
    Game.create!(game_id: game_id, game_state: initial_game_state)
  end

  private

  def initial_game_state
    {
      game_id: game_id,
      player_one: {
        name: player_one,
        army: Army.new
      },
      player_two: {
        name: player_two,
        army: Army.new
      },
      current_player:   "player_one",
      opposing_player:  "player_two",
      available_quests: [
        "Hercules",
        "Achilles",
        "Perseus",
        "Minotaur",
        "Medusa",
        "Kraken"
      ]
    }
  end
end
