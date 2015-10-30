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
    @game = $game
    @attacked = session[:attacked?]
    erb :play
  end

  get '/attack' do
    session[:attacked?] = true
    $game.attack
    redirect '/play'
  end

  run! if app_file == $0
end
