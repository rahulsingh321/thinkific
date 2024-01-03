# frozen_string_literal: true

module Thinkific
  module Admin
    class ProductPublishRequest
      class << self
        include Thinkific::Admin::CommonOperations

        def approve(id, params = {})
          path = entity_name(id) + "/approve"

          Thinkific::Connection.make_api_call(:create, path, params)
        end

        def deny(id, params = {})
          path = entity_name(id) + "/deny"

          Thinkific::Connection.make_api_call(:create, path, params)
        end
      end
    end
  end
end
