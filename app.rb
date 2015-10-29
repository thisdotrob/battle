require 'sinatra/base'
require 'player'

class Battle < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  post '/names' do
    player1 = Player.new(params[:player1_name])
    player2 = Player.new(params[:player2_name])
    $game = Game.new(player1, player2)
    redirect '/play'
  end

  get '/play' do
    @player1_name = $game.player1_name
    @player2_name = $game.player2_name
    @player2_hitpoints = $game.player2_hitpoints
    @attacked = session[:attacked?]
    erb :play
  end

  get '/attack' do
    session[:attacked?] = true
    Game.new.attack
    redirect '/play'
  end

  run! if app_file == $0
end
