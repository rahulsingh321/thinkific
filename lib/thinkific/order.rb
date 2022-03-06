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

        response = Thinkific::Connection.get_json(order_path, opts)

        orders = []
        page_number = 1

        while page_number <= response['meta']['pagination']['total_pages']
          response = Thinkific::Connection.get_json(order_path(page_number), opts)
          orders << response['items']
          page_number += 1
        end

        return orders.flatten
      end


      def order_path(page_number = 1)
        "/orders?page=#{page_number}&limit=250"
      end
    end
  end
end
