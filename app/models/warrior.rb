class Warrior
  attr_accessor :attack, :defense, :warrior_name

  FULL_ATTACK   = 5
  FULL_DEFENSE  = 3

  def initialize(warrior_name:)
    self.attack       = FULL_ATTACK
    self.defense      = FULL_DEFENSE
    self.warrior_name = warrior_name
  end

  def to_s
    "Name: #{warrior_name}, Attack: #{attack}, Defense: #{defense}"
  end
end
