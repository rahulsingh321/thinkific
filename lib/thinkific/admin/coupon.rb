# frozen_string_literal: true

module Thinkific
  module Admin
    class Coupon
      class << self
        include Thinkific::Admin::CommonOperations

        def create_bulk_coupon(params)
          path = entity_name + "/bulk_create"

          Thinkific::Connection.make_api_call(:get, path, params)
        end
      end
    end
  end
end
