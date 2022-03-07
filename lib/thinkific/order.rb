module Thinkific
  #
  # Thinkific Admin Order API
  #
  # {https://developers.thinkific.com/api/api-documentation/#/Orders}
  #
  class Order
    PER_PAGE = 250
    ORDERS_PATH = "/orders"

    class << self
      # {https://developers.thinkific.com/api/api-documentation/#/Orders/getOrders}
      def all(opts = {})
        path = endpoint
        opts = opts

        response = Thinkific::Connection.get_json(path, opts)
        return [] unless response["items"].any?

        page_number = 1
        orders = response["items"]

        while page_number <= response["meta"]["pagination"]["total_pages"]
          page_number += 1
          response = Thinkific::Connection.get_json(endpoint(page_number), opts)
          orders += response["items"]
        end

        orders
      end

      def endpoint(page_number = 1)
        ORDERS_PATH + "&page=#{page_number}&limit=#{PER_PAGE}"
      end
    end
  end
end
