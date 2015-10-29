require 'game'

describe Game do
  subject(:game){ Game.new }

  let(:player){ double(:player) }

  context '#attack' do
    it 'calls #damage on the player' do
      expect(player).to receive(:damage)
      game.attack(player)
    end
  end
  
end
