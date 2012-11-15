require 'sinatra'
require 'haml'
require  File.expand_path(File.join(File.dirname(__FILE__), 'shootout'))
  
enable :sessions

get '/' do
  haml :index
end

get '/new-game' do
  id = random_id
  session["game_#{id}"] = Game.new
  redirect "/game/#{id}"
end    

get '/game/:id' do
  @game = session["game_#{params[:id]}"]  
  @game.next
  haml :game
end  


def random_id
  (0...8).map{65.+(rand(26)).chr}.join
end