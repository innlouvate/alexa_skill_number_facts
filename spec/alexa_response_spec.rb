require 'alexa/response'

RSpec.describe Alexa::Response do
  describe '.build' do
    it 'returns a JSON response with a custom string if provided' do
      expected_response = {
        version: "1.0",
        response: {
          outputSpeech: {
            type: "PlainText",
            text: "Custom String"
          }
        }
      }.to_json

      expect(Alexa::Response.build("Custom String")).to eq expected_response
    end

    it 'returns a minimal JSON response otherwise' do
      minimal_response = {
        version: "1.0",
        response: {
          outputSpeech: {
            type: "PlainText",
            text: "Oops, there seems to have been an error"
          }
        }
      }.to_json

      expect(Alexa::Response.build).to eq minimal_response
    end
  end
end
