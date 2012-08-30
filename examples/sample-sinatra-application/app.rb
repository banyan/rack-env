require 'sinatra'

require 'rack/env'
use Rack::Env

get '/' do
  ENV['FOO']
end
