require 'sinatra/base'
require_relative './lib/player'
require_relative './lib/game'

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
    erb :play
  end

  get '/attack' do
    $game.attack
    $game.game_over? ? redirect('/game-over') : redirect('/play')
  end

  get '/game-over' do
    @game = $game
    erb :game_over

  end
  run! if app_file == $0
end
