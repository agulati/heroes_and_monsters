class Army
  attr_reader :cards

  def initialize
    @cards = []
    get_army
  end

  def to_s
    cards.map(&:to_s)
  end

  private

  def get_army
    while cards.length < 5 do
      new_name = Faker::Movies::LordOfTheRings.character
      name_exists = !cards.detect { |c| c.warrior_name == new_name }.nil?
      cards << Warrior.new(warrior_name: new_name) unless name_exists
    end
  end
end
