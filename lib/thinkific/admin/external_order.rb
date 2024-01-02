# frozen_string_literal: true

module Thinkific
  module Admin
    class ExternalOrder
      class << self
        include Thinkific::Admin::CommonOperations

        def refund_transaction(id, params = {})
          path = entity_name(id) + "/transactions/refund"

          Thinkific::Connection.make_api_call(:post, path, params)
        end

        def purchase_transaction
          path = entity_name(id) + "/transactions/purchase"

          Thinkific::Connection.make_api_call(:post, path, params)
        end
      end
    end
  end
end
