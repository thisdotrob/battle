class Player
  attr_reader :name, :hitpoints

  DEF_HITPOINTS = 100

  def initialize(name)
    @name = name
    @hitpoints = DEF_HITPOINTS
  end

end
