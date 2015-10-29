require 'player'

describe Player do
  subject(:player){ Player.new(:name) }

  context '#name' do
    it 'returns the name' do
      expect(player.name).to eq (:name)
    end
  end

  context '#hitpoints' do
    it 'returns the default hitpoints' do
      expect(player.hitpoints).to eq (Player::DEF_HITPOINTS)
    end
  end
end
