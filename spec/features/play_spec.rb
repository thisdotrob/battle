feature '/play' do

  context 'setup' do
    scenario 'player 1 has first turn 50% of the time' do
      allow(Kernel).to receive(:rand) {0.501}
      sign_in_and_play
      expect(page).to have_content 'Player1\'s turn'
    end
    scenario 'player 2 has first turn 50% of the time' do
      allow(Kernel).to receive(:rand) {0.499}
      sign_in_and_play
      expect(page).to have_content 'Player2\'s turn'
    end
    scenario 'displays names' do
      sign_in_and_play
      expect(page).to have_content 'Player1 vs. Player2'
    end
    scenario 'displays both players hitpoints' do
      sign_in_and_play
      expect(page).to have_content 'Player1: 100HP Player2: 100HP'
    end

  end

  context 'post attack' do
    before :each do
      allow(Kernel).to receive(:rand) {0.501}
    end
    scenario 'displays confirmation of attack on Player 2' do
      sign_in_and_play
      click_button('Attack')
      expect(page).to have_content 'Player1 attacked Player2!'
    end
    scenario 'displays confirmation of attack on Player 1' do
      sign_in_and_play
      2.times { click_button('Attack') }
      expect(page).to have_content 'Player2 attacked Player1!'
    end
    scenario 'displays reduced hitpoints after attack on Player 2' do
      sign_in_and_play
      5.times { click_button('Attack') }
      expect(page).to have_content 'Player1: 80HP Player2: 70HP'
    end
    scenario 'switches users' do
      sign_in_and_play
      click_button('Attack')
      expect(page).to have_content 'Player2\'s turn'
    end
  end

context 'game over' do
  it 'returns error when player reaches 0 points' do
    allow(Kernel).to receive(:rand) { 0.499 }
    sign_in_and_play
    19.times { click_button('Attack') }
    expect(current_path).to eql("/game-over")
  end
  it 'should return who lost' do
    allow(Kernel).to receive(:rand) { 0.499 }
    sign_in_and_play
    19.times { click_button('Attack') }
    expect(page).to have_content "Player2 has lost the game!"
  end
end

end
