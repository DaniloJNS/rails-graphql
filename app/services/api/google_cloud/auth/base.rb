# frozen_string_literal: true

require 'googleauth/stores/redis_token_store'

module Api
  module GoogleCloud
    module Auth
      module Base
        OOB_URI = 'urn:ietf:wg:oauth:2.0:oob'
        TOKEN_PATH = $redis
        SCOPES = [
          Google::Apis::CalendarV3::AUTH_CALENDAR,
          Google::Apis::PeopleV1::AUTH_USER_EMAILS_READ,
          Google::Apis::PeopleV1::AUTH_USER_GENDER_READ,
          Google::Apis::PeopleV1::AUTH_USER_BIRTHDAY_READ,
          Google::Apis::PeopleV1::AUTH_USERINFO_PROFILE,
          Google::Apis::PeopleV1::AUTH_USERINFO_EMAIL
        ].freeze
        # TODO: restrict scopes of infos person

        def client_id
          secret = Rails.application.credentials.config[:google_calendar]
          @client_id ||= Google::Auth::ClientId.new secret[:client_id], secret[:client_secret]
        end

        def token_store
          @token_store ||= Google::Auth::Stores::RedisTokenStore.new redis: $redis
        end

        def authorizer
          @authorizer ||= Google::Auth::UserAuthorizer.new client_id, SCOPES, token_store
        end
      end
    end
  end
end
