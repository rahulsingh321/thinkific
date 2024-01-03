# frozen_string_literal: true

module Thinkific
  module Admin
    class Promotion
      class << self
        include Thinkific::Admin::CommonOperations

        def get_coupon(params = {})
          path = entity_name + '/by_coupon'
          process_api_call(:get, path, params)
        end
      end
    end
  end
end
