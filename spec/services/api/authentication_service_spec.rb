# frozen_string_literal: true

require 'rails_helper'

describe Api::GoogleCloud::Auth::AuthenticationService do
  let(:request_url) { 'https://oauth2.googleapis.com/token' }
  context 'unauthorized' do
    it 'when token is invalid' do
      stub_request(:post, request_url)
        .to_return(status: 200, headers: { 'Content-Type' => 'application/json; charset=utf-8' },
                   body: "{
                            \"access_token\": \"valid token\",
                            \"expires_in\": 3599,
                            \"refresh_token\": \"token refresh\",
                            \"scope\": \"https://www.googleapis.com/auth/calendar.readonly\",
                            \"token_type\": \"Bearer\"
                          }")

      expect { described_class.call 'valid token' }.not_to raise_error Signet::AuthorizationError
    end
  end

  context 'authorized' do
    it 'when token is valid' do
      expect { described_class.call 'invalid token' }.to raise_error Signet::AuthorizationError
    end
  end
end
