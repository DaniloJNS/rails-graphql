# frozen_string_literal: true

module Api
  module GoogleCloud
    module People
      class RegisterService < ApplicationService
        def initialize(credential)
          @service = Google::Apis::PeopleV1::PeopleServiceService.new
          @service.authorization = credential
        end

        def call
          @service.get_person(
            'people/me',
            person_fields: 'emailAddresses,genders,names,birthdays'
          )
        end
      end
    end
  end
end
