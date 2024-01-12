# frozen_string_literal: true

class Thinkific::Client
  module Coupons

    # Gets a list of Coupons owned by the authenticated user.
    #
    # @example
    #   Thinkific.coupons
    #
    # @param  [Hash] options A customizable set of options.
    # @option options [Integer] :page The page number.
    # @option options [Integer] :per_page The number of results per page.
    # (Any provided options will be passed to Thinkific. See {https://developers.thinkific.com/api/api-documentation/#/Coupons})
    #
    # @return [Array<Thinkific::ObjectifiedHash>]
    def coupons(options = {})
      get('/coupons', query: options)
    end

    # Get a single Coupon.
    #
    # @example
    #   Thinkific.coupon(1)
    #
    # @param  [Integer] id The ID of a Coupon.
    # @return [Thinkific::ObjectifiedHash] Returns information about a Coupon
    def coupon(id)
      get("/coupons/#{id}")
    end

    # Creates a new Coupons.
    #
    # @example
    #   Thinkific.create_coupons(body_params)
    #
    # @param  [Hash] body_params A customizable set of body.
    # @return [Thinkific::ObjectifiedHash] Information about created Coupons.
    def create_coupons(body_params)
      post("/coupons", body: body_params)
    end

    # Creates a new Bulk Coupons.
    #
    # @example
    #   Thinkific.create_bulk_coupon(body_params)
    #
    # @param  [Hash] body_params A customizable set of body.
    # @return [Thinkific::ObjectifiedHash] Information about created Coupons.
    def create_bulk_coupon(body_params)
      post("/coupons/bulk_create", body: body_params)
    end

    # Updates a Coupons.
    #
    # @example
    #   Thinkific.edit_coupons(1, edit_params)
    #
    # @param  [Integer] id The ID of a Coupons.
    # @param  [Hash] edit_params A customizable set of body.
    # @return [Thinkific::ObjectifiedHash] Information about updated Coupons.
    def edit_coupons(id, edit_params = {})
      put("/coupons/#{id}", body: edit_params)
    end

    # Deletes a Coupons.
    #
    # @example
    #   Thinkific.delete_coupons(1)
    #
    # @param  [Integer] id The ID of a Coupons.
    # @return [void] This API call returns an empty response Coupons.
    def delete_coupons(id)
      delete("/coupons/#{id}")
    end
  end
end
