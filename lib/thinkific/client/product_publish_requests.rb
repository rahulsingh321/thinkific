# frozen_string_literal: true

class Thinkific::Client
  module ProductPublishRequests

    # Gets a list of Product Publish Requests owned by the authenticated user.
    #
    # @example
    #   Thinkific.product_publish_requests
    #
    # @param  [Hash] options A customizable set of options.
    # @option options [Integer] :page The page number.
    # @option options [Integer] :per_page The number of results per page.
    # (Any provided options will be passed to Thinkific. See {https://developers.thinkific.com/api/api-documentation/#/Product%20Publish%20Request})
    #
    # @return [Array<Thinkific::ObjectifiedHash>]
    def product_publish_requests(options = {})
      get('/product_publish_requests', query: options)
    end

    # Get a single Product Publish Request.
    #
    # @example
    #   Thinkific.product_publish_request(1)
    #
    # @param  [Integer] id The ID of a Product Publish Request.
    # @return [Thinkific::ObjectifiedHash] Returns information about a Product Publish Requests.
    def product_publish_request(id)
      get("/product_publish_requests/#{id}")
    end

    # Approves the Product Publish Request identified by the provided id.
    #
    # @example
    #   Thinkific.approve_product_publish_requests(1, body_params)
    #
    # @param  [Integer] id The ID of a Product Publish Request.
    # @param  [Hash] body_params A customizable set of body.
    # @return [Thinkific::ObjectifiedHash] Information about created Product Publish Request.
    def approve_product_publish_requests(id, body_params)
      post("/product_publish_requests/#{id}/approve", body: body_params)
    end

    # Denies the Product Publish Request identified by the provided id.
    #
    # @example
    #   Thinkific.deny_product_publish_requests(1, body_params)
    #
    # @param  [Integer] id The ID of a Product Publish Request.
    # @param  [Hash] body_params A customizable set of body.
    # @return [Thinkific::ObjectifiedHash] Information about created Product Publish Request.
    def deny_product_publish_requests(id, body_params)
      post("/product_publish_requests/#{id}/deny", body: body_params)
    end
  end
end
