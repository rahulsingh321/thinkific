# frozen_string_literal: true

module Thinkific
  module Admin
    class Coupons
      class << self
        include Thinkific::Admin::CommonOperations

        def create_bulk_coupon(params)
          path = entity_name + "/bulk_create"
          process_api_call(:post, path, params)
        end

        def list_coupons(params={})
          path = entity_name
          process_api_call(:get, path, params)
        end
      end
    end
  end
end
