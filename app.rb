require 'sinatra'
require 'sinatra/multi_route'

configure :development, :test do
  require 'dotenv'; Dotenv.load # Load ENV vars
  require 'pry'
end

require 'json'
require 'redis'

Dir["./lib/api/*.rb"].each {|file| require file }
Dir["./lib/helpers/*.rb"].each {|file| require file }

$redis = Redis.new

get '/' do
  erb :index
end

route :get, :post, '/artist' do
  @artist = get_set_artist(params[:name])
  erb :artist
end

post '/send_text' do
  content_type :json
  artist = get_set_artist(params[:name])
  @msg_sent = send_text_message(artist[:name], artist[:track], params[:phone])
  { msg_sent: @msg_sent, artist: artist }.to_json
end
