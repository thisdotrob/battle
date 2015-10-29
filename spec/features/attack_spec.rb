feature '/attack' do
  scenario 'Displays confirmation of attack on Player 2' do
    sign_in_and_play
    click_button('Attack')
    expect(page).to have_content 'Player 1 attacked Player 2!'
  end
end
