# frozen_string_literal: true

require 'rails_helper'

describe 'authorization' do
  context 'successfulyy' do
    it 'request url access' do
      get '/api/v1/calendar/authorization/url'

      expect(response).to have_http_status(:ok)
      expect(parsed_body[:url]).to include 'https://www.googleapis.com/auth/calendar.readonly'
    end
  end

  context 'token' do
    it 'generate token access' do
      post '/api/v1/calendar/authorization/access', params: { token: 'asdasd' }
    end
  end
end
