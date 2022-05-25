module Api
  module GoogleCloud
    module Auth
      class AuthenticationTokenService < ApplicationService
        HMAC_SECRET = ENV.fetch('HMAC_SECRET') { 'my_secret' }
        ALGORITM_TYPE = 'HS256'.freeze

        def initialize(credentials)
          super
          @credentials = credentials
        end

        def call
          payload = { credentials: @credentials }

          JWT.encode payload, HMAC_SECRET, ALGORITM_TYPE
        end

        def self.decode(token)
          JWT.decode(token, HMAC_SECRET, true, { algorithm: ALGORITM_TYPE })
             .first.symbolize_keys
        rescue JWT::DecodeError
          { user_id: nil }
        end
      end
    end
  end
end
