require 'dotenv'; Dotenv.load # Load ENV vars
require 'sinatra'
Dir["./lib/api/*.rb"].each {|file| require file }

get '/' do
  @test = 'yeah'
  erb :index
end
