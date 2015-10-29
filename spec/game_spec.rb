require 'game'

describe Game do
  subject(:game){ Game.new(player1, player2) }

  let(:player1){ double(:player1) }
  let(:player2){ double(:player2) }

  context '#initialize' do
    it 'creates two Player instances' do
      expect(game.players).to eq ([player1, player2])
    end
  end

  context '#attack' do
    it 'calls #damage on the player' do
      expect(player1).to receive(:damage)
      game.attack
    end
  end

end
