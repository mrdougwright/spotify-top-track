ENV['RACK_ENV'] = 'test'

require 'minitest/autorun'
require 'rack/test'
require_relative '../lib/app.rb'

include Rack::Test::Methods

def app
  Sinatra::Application
end
