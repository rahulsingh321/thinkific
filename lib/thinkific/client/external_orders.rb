# frozen_string_literal: true

class Thinkific::Client
  module ExternalOrders


    # Creates a new ExternalOrders.
    #
    # @example
    #   Thinkific.create_external_orders(body_params)
    #
    # @param  [Hash] body_params A customizable set of body.
    # @return [Thinkific::ObjectifiedHash] Information about created ExternalOrders.
    def create_external_orders(body_params)
      post("/external_orders", body: body_params)
    end

    # Create a new transaction refund for the External Order.
    #
    # @example
    #   Thinkific.external_orders_refund_transaction(1, body_params)
    #
    # @param  [Integer] id The ID of a ExternalOrders.
    # @param  [Hash] body_params A customizable set of body.
    # @return [Thinkific::ObjectifiedHash] Information about created ExternalOrders.
    def external_orders_refund_transaction(id, body_params)
      post("/external_orders/#{id}/transactions/refund", body: body_params)
    end


    # Create a new transaction purchase for the External Order.
    #
    # @example
    #   Thinkific.external_orders_purchase_transaction(1, body_params)
    #
    # @param  [Integer] id The ID of a ExternalOrders.
    # @param  [Hash] body_params A customizable set of body.
    # @return [Thinkific::ObjectifiedHash] Information about created ExternalOrders.
    def external_orders_purchase_transaction(id, body_params)
      post("/external_orders/#{id}/transactions/purchase", body: body_params)
    end
  end
end
