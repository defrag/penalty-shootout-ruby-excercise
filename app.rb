require 'sinatra'
require 'haml'
require  File.expand_path(File.join(File.dirname(__FILE__), 'shootout'))
  
enable :sessions

get '/' do
  haml :index
end

get '/new-game' do
  id = random_id
  session['game'] ||= id
  redirect "/game/#{id}"
end    

get '/game/:id' do
  haml :game
end  

def random_id
  (0...8).map{65.+(rand(26)).chr}.join
end