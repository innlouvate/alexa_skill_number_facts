require 'sinatra'
require './lib/alexa/request'
require './lib/alexa/response'
require './lib/number_fact'

post '/' do
  number_fact = NumberFact.build(Alexa::Request.new(request))
  Alexa::Response.build(number_fact.text)
end
