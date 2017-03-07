require 'dotenv'; Dotenv.load # Load ENV vars
require 'pry'

require 'sinatra'
Dir["./lib/api/*.rb"].each {|file| require file }
Dir["./lib/helpers/*.rb"].each {|file| require file }

get '/' do
  erb :index
end

post '/artist' do
  @artist = get_artist_and_track(params[:name])
  erb :artist
end

post '/send_text' do
  
end
