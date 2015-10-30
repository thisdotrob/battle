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
    scenario 'displays confirmation of attack on Player 2' do
      sign_in_and_play
      click_button('Attack')
      expect(page).to have_content 'Player1 attacked Player2!'
    end
    scenario 'displays reduced hitpoints after attack on Player 2' do
      sign_in_and_play
      5.times { click_button('Attack') }
      expect(page).to_not have_content 'Player2: 100HP'
      expect(page).to have_content 'Player2: 50HP'
    end
    scenario 'switches users' do
      allow(Kernel).to receive(:rand) {0.501}
      sign_in_and_play
      click_button('Attack')
      expect(page).to have_content 'Player2\'s turn'
    end
  end

end
