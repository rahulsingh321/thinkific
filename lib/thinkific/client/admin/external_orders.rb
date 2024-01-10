# frozen_string_literal: true

module Thinkific
  module Admin
    class ExternalOrders
      class << self
        include Thinkific::Admin::CommonOperations

        def refund_transaction(id, params = {})
          path = entity_name(id) + "/transactions/refund"
          process_api_call(:post, path, params)
        end

        def purchase_transaction(id, params = {})
          path = entity_name(id) + "/transactions/purchase"
          process_api_call(:post, path, params)
        end
      end
    end
  end
end
