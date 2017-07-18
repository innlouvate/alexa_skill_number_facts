require 'net/http'

class NumberFact
  attr_reader :text
  def initialize(number, fact_type, client = Net::HTTP)
    if (!number)
      @text = "Please format your question as, tell me about a math or trivia fact about a number"
    else
      number_facts_uri = URI("http://numbersapi.com/#{ number }/#{ fact_type }")
      @text = client.get(number_facts_uri)
    end
  end

  def self.build(alexa_request, client = Net::HTTP)
    new(alexa_request.slot_value("Number"), alexa_request.slot_value("FactType"))
  end
end
