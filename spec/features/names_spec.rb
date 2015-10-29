feature 'Enter names' do
  scenario 'submitting names' do
    visit('/')
    fill_in :player1_name, with: 'Player1'
    fill_in :player2_name, with: 'Player2'
    click_button 'Play'
    expect(page).to have_content 'Player1 vs. Player2'
  end
end
