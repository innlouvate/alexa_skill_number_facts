require 'sinatra'
require 'json'
require 'net/http'

post '/' do
  number = JSON.parse(request.body.read)["request"]["intent"]["slots"]["Number"]["value"]
  number_facts_uri = URI("http://numbersapi.com/#{number}")
  number_fact = Net::HTTP.get(number_facts_uri)

  {
    version: "1.0",
    response: {
      outputSpeech: {
          type: "PlainText",
          text: number_fact
        }
    }
  }.to_json
end
