feature '/play' do
  scenario 'displays names' do
    sign_in_and_play
    expect(page).to have_content 'Player1 vs. Player2'
  end
  scenario 'displays Player 2\'s hit points' do
    sign_in_and_play
    expect(page).to have_content 'Player2: 100HP'
  end
end
