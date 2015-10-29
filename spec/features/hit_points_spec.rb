feature 'View hit points' do
  scenario 'see Player 2 hit points' do
    visit('/')
    fill_in :player1_name, with: 'Player1'
    fill_in :player2_name, with: 'Player2'
    click_button 'Play'
    expect(page).to have_content 'Player2: 100HP'
  end
end
