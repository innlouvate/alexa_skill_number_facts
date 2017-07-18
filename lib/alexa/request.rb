require 'json'

module Alexa
  class Request
    def initialize(sinatra_request)
      # Since we probably want to do more with this request,
      # we'll store the request as a hash internally
      @request = JSON.parse(sinatra_request.body.read)
    end

    def slot_value(slot_name)
      # this is essentially copy-pasted from server.rb
      @request["request"]["intent"]["slots"][slot_name]["value"]
    end
  end
end
