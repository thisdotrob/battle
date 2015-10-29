require 'player'

describe Player do
  subject(:player1){ Player.new(:name) }
  let(:player2){ Player.new(:name) }

  context '#name' do
    it 'returns the name' do
      expect(player1.name).to eq (:name)
    end
  end

  context '#hitpoints' do
    it 'returns the default hitpoints' do
      expect(player1.hitpoints).to eq (Player::DEF_HITPOINTS)
    end
  end

  context '#damage' do
    it 'reduces hitpoints by 10' do
      expect{player1.damage}.to change(player1, :hitpoints).by(-10)
    end
  end
end
