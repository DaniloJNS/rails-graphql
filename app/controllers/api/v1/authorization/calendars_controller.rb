module Api
  module V1
    module Authorization
      class CalendarsController < ApplicationController
        def url
          @response = Api::GoogleCloud::Auth::GenerateUrlAuthService.call

          render json: @response
        end

        def access
          token = params.require :token
          @credentials = Api::GoogleCloud::Auth::AuthenticationService.call params.require(:token)
          render status: :ok, json: 'permitido'
        rescue Signet::AuthorizationError => e
          render status: :unauthorized, json: e
        end
      end
    end
  end
end
