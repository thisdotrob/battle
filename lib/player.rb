class Player
  attr_reader :name, :hitpoints

  DEF_HITPOINTS = 100

  def initialize(name)
    @name = name
    @hitpoints = DEF_HITPOINTS
  end

  def attack(player)
    player.damage
  end

  def damage
    self.hitpoints -= 10
  end

  private

  attr_writer :hitpoints

end
