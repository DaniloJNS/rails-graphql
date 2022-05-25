# frozen_string_literal: true

module Api
  module GoogleCloud
    module Auth
      # Authorization acess token to google-apis
      class AuthenticationService < ApplicationService
        include Base
        USER_ID = 'default'

        def initialize(token)
          super
          @client_id = client_id
          @authorizer = authorizer
          @token = token
        end

        def call
          @credentials = @authorizer.get_credentials_from_code(
            user_id: USER_ID, code: @token, base_url: OOB_URI
          )
        end
      end
    end
  end
end
