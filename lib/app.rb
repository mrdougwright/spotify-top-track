require 'dotenv'; Dotenv.load # Load ENV vars
require 'sinatra'

get '/' do
  @test = 'yeah'
  erb :index
end
