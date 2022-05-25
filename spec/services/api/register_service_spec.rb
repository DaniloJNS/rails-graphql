require 'rails_helper'

describe Api::GoogleCloud::People::RegisterService do
  context 'Register new user' do
    let(:request_url) { 'https://oauth2.googleapis.com/token' }

    subject { Api::GoogleCloud::Auth::AuthenticationService.call('4/1AX4XfWguyr81GtT9Ql5nsOM42JsY7ZMOUS2m9sGaFZrN7Ob8rnEXswqVtbg') }


    it 'with successfully' do
      # stub_request(:post, request_url)
      #   .to_return(status: 200, headers: { 'Content-Type' => 'application/json; charset=utf-8' },
      #              body: "{
      #                       \"access_token\": \"valid token\",
      #                       \"expires_in\": 3599,
      #                       \"refresh_token\": \"token refresh\",
      #                       \"scope\": \"https://www.googleapis.com/auth/calendar.readonly\",
      #                       \"token_type\": \"Bearer\"
      #                     }")
      #
      VCR.use_cassette('request info user') do
        expect(described_class.call(subject)).to eq 'bla bla'
      end
    end
  end
end
