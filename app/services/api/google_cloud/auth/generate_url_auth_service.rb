module Api
  module GoogleCloud
    module Auth
      class GenerateUrlAuthService < ApplicationService
        include Base
        URL = {}.freeze

        def initialize
          @url = {}
          @client_id = client_id
          @authorizer = authorizer
        end

        def call
          @url[:url] = @authorizer.get_authorization_url base_url: OOB_URI
          @url
        end
      end
    end
  end
end
