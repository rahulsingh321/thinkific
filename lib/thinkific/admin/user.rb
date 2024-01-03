# frozen_string_literal: true

module Thinkific
  module Admin
    class User
      class << self
        include Thinkific::Admin::CommonOperations

        def authentications(id, provider, params = {})
          path = entity_name(id) + "authentications/#{provider}"

          Thinkific::Connection.make_api_call(:get, path, params)
        end
      end
    end
  end
end
