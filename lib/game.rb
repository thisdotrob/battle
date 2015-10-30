require 'forwardable'

class Game
  extend Forwardable
  attr_reader :player1, :player2, :current_player

  def_delegator :player1, :name, :player1_name
  def_delegator :player2, :name, :player2_name
  def_delegator :player2, :hitpoints, :player2_hitpoints
  def_delegator :current_player, :name, :current_player_name

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    set_current_player
  end

  def attack
    switch_turns
    player2.damage
    @attacked = true
  end

  def attacked?
    @attacked
  end

  private

  attr_writer :current_player

  def switch_turns
    @current_player = (@current_player == player1 ? player2 : player1)
  end

  def set_current_player
    @current_player = Kernel.rand > 0.5 ? self.player1 : self.player2
  end

end
