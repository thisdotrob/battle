require 'forwardable'

class Game
  extend Forwardable
  attr_reader :player1, :player2

  def_delegator :player1, :name, :player1_name
  def_delegator :player2, :name, :player2_name
  def_delegator :player2, :hitpoints, :player2_hitpoints
  def_delegator :player2, :damage, :attack

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

end
