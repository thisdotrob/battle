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

  context '#current_turn' do
    it 'sets current turn to Player 1 with probability 0.5' do
      allow(Kernel).to receive(:rand) { 0.501 }
      seeded_game = described_class.new(player1, player2)
      expect(seeded_game.current_player).to eq (player1)
    end
    it 'sets current turn to Player 2 with probability 0.5' do
      allow(Kernel).to receive(:rand) { 0.499 }
      seeded_game = described_class.new(player1, player2)
      expect(seeded_game.current_player).to eq (player2)
    end

  end

  context '#attack' do
    before :each do
      allow(Kernel).to receive(:rand) { 0.501 }
    end
    it 'calls #damage on the player' do
      seeded_game = described_class.new(player1, player2)
      expect(player2).to receive(:damage)
      seeded_game.attack
    end
    it 'switches turns' do
      allow(player2).to receive(:damage)
      seeded_game = described_class.new(player1, player2)
      seeded_game.attack
      expect(seeded_game.current_player).to eq (player2)
    end
  end

  context 'delegator' do
    it 'delegates #player1_name to Player 1 object' do
      expect(player1).to receive(:name)
      game.player1_name
    end
    it 'delegates #player1_hitpoints to Player 1 object' do
      expect(player1).to receive(:hitpoints)
      game.player1_hitpoints
    end
    it 'delegates #player2_name to Player 2 object' do
      expect(player2).to receive(:name)
      game.player2_name
    end
    it 'delegates #player2_hitpoints to Player 2 object' do
      expect(player2).to receive(:hitpoints)
      game.player2_hitpoints
    end
    it 'delegates #current_player_name to the current player object' do
      allow(Kernel).to receive(:rand) { 0.501 }
      seeded_game = described_class.new(player1, player2)
      expect(player1).to receive(:name)
      seeded_game.current_player_name
    end
  end

  context '#game_over?' do
    it 'should end the game when 0 points' do
      allow(Kernel).to receive(:rand) { 0.501 }
      seeded_game = described_class.new(player1, player2)
      allow(player1).to receive(:hitpoints){0}
      expect(seeded_game.game_over?).to eq true
    end
  end

end
