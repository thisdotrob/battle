feature '/play' do
  scenario 'displays names' do
    sign_in_and_play
    expect(page).to have_content 'Player1 vs. Player2'
  end
  scenario 'displays Player 2\'s hit points' do
    sign_in_and_play
    expect(page).to have_content 'Player2: 100HP'
  end
  scenario 'Displays confirmation of attack on Player 2' do
    sign_in_and_play
    click_button('Attack')
    expect(page).to have_content 'Player1 attacked Player2!'
  end
end