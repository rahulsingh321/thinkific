module Thinkific
  #
  # Thinkific Admin Order API
  #
  # {https://developers.thinkific.com/api/api-documentation/#/Orders}
  #
  class Order
    ORDERS_PATH   = '/orders'

    class << self

      # {https://developers.thinkific.com/api/api-documentation/#/Orders/getOrders}
      def all(opts = {})
        path, opts = [ORDERS_PATH, opts]

        response = Thinkific::Connection.get_json(path, opts)
        response['items']
      end

    end
  end
end
