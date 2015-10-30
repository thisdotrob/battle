require 'game'

describe Game do
  subject(:game){ Game.new(player1, player2) }

  let(:player1){ double(:player1) }
  let(:player2){ double(:player2) }

  context '#initialize' do
    it 'creates Player 1' do
      expect(game.player1).to eq (player1)
    end
    it 'creates Player 2' do
      expect(game.player2).to eq (player2)
    end
  end

  context '#attack' do
    it 'calls #damage on the player' do
      expect(player2).to receive(:damage)
      game.attack
    end
  end

end
