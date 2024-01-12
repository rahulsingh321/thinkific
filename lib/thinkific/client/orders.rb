# frozen_string_literal: true

class Thinkific::Client
  module Orders

    # Gets a list of Orders owned by the authenticated user.
    #
    # @example
    #   Thinkific.orders
    #
    # @param  [Hash] options A customizable set of options.
    # @option options [Integer] :page The page number.
    # @option options [Integer] :per_page The number of results per page.
    # (Any provided options will be passed to Thinkific. See {https://developers.thinkific.com/api/api-documentation/#/Orders})
    #
    # @return [Array<Thinkific::ObjectifiedHash>]
    def orders(options = {})
      get('/orders', query: options)
    end

    # Get a single Order.
    #
    # @example
    #   Thinkific.order(1)
    #
    # @param  [Integer] id The ID of a Orders.
    # @return [Thinkific::ObjectifiedHash] Returns information about a Orders
    def order(id)
      get("/orders/#{id}")
    end
  end
end
