# frozen_string_literal: true

class Thinkific::Client
  module Promotions

    # Gets a list of Promotions owned by the authenticated user.
    #
    # @example
    #   Thinkific.promotions
    #
    # @param  [Hash] options A customizable set of options.
    # @option options [Integer] :page The page number.
    # @option options [Integer] :per_page The number of results per page.
    # (Any provided options will be passed to Thinkific. See {https://developers.thinkific.com/api/api-documentation/#/Promotions})
    #
    # @return [Array<Thinkific::ObjectifiedHash>]
    def promotions(options = {})
      get('/promotions', query: options)
    end

    # Get a single Promotions.
    #
    # @example
    #   Thinkific.promotion(1)
    #
    # @param  [Integer] id The ID of a Promotions.
    # @return [Thinkific::ObjectifiedHash] Returns information about a Promotions
    def promotion(id)
      get("/promotions/#{id}")
    end

    # Creates a new Promotions.
    #
    # @example
    #   Thinkific.create_promotions(body_params)
    #
    # @param  [Hash] body_params A customizable set of body.
    # @return [Thinkific::ObjectifiedHash] Information about created Promotions.
    def create_promotions(body_params)
      post("/promotions", body: body_params)
    end

    # Updates a Promotions.
    #
    # @example
    #   Thinkific.edit_promotions(1, edit_params)
    #
    # @param  [Integer] id The ID of a Promotions.
    # @param  [Hash] edit_params A customizable set of body.
    # @return [Thinkific::ObjectifiedHash] Information about updated Promotions.
    def edit_promotions(id, edit_params = {})
      put("/promotions/#{id}", body: edit_params)
    end

    # Deletes a Promotions.
    #
    # @example
    #   Thinkific.delete_promotions(1)
    #
    # @param  [Integer] id The ID of a Promotions.
    # @return [void] This API call returns an empty response Promotions.
    def delete_promotions(id)
      delete("/promotions/#{id}")
    end

    # Find a Promotion by Coupon Code and Product
    #
    # @example
    #   Thinkific.find_promotions_by_coupon({product_id: 1, coupon_code: 'code123'})
    #
    # @param  [Hash] options should have product_id and coupon_code.
    # @return [Thinkific::ObjectifiedHash] Returns information about a Promotions
    def find_promotions_by_coupon(options = {})
      get("/promotions/by_coupon", body: options)
    end
  end
end
