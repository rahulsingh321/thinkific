# frozen_string_literal: true

class Thinkific::Client
  module Products


    # Gets a list of Products owned by the authenticated user.
    #
    # @example
    #   Thinkific.products
    #
    # @param  [Hash] options A customizable set of options.
    # @option options [Integer] :page The page number.
    # @option options [Integer] :per_page The number of results per page.
    # (Any provided options will be passed to Thinkific. See {https://developers.thinkific.com/api/api-documentation/#/Products})
    #
    # @return [Array<Thinkific::ObjectifiedHash>]
    def products(options = {})
      get('/products', query: options)
    end

    # Get a single Products.
    #
    # @example
    #   Thinkific.product(1)
    #
    # @param  [Integer] id The ID of a Products.
    # @return [Thinkific::ObjectifiedHash] Returns information about a Products
    def product(id)
      get("/products/#{id}")
    end

    # Returns a list of products that are related to the Product identified by the provided id.
    #
    # @example
    #   Thinkific.products_related_list(1)
    #
    # @param  [Integer] id The ID of a Products.
    # @param  [Hash] options A customizable set of options.
    # @option options [Integer] :page The page number.
    # @option options [Integer] :per_page The number of results per page.
    #
    # @return [Array<Thinkific::ObjectifiedHash>]
    def products_related_list(id)
      get("/products/#{id}/related")
    end
  end
end
