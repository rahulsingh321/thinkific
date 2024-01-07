# frozen_string_literal: true

module Thinkific
  module Admin
    class Users
      class << self
        include Thinkific::Admin::CommonOperations

        def authentications(id, provider, params = {})
          path = entity_name(id) + "authentications/#{provider}"
          process_api_call(:get, path, params)
        end
      end
    end
  end
end
