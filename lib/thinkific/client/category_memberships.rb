# frozen_string_literal: true

class Thinkific::Client
  module CategoryMemberships

    # Create one or more Products to a Category
    #
    # @example
    #   Thinkific.add_products_to_category(id, body_params)
    #
    # @param  [Integer] id The ID of a category.
    # @param  [Hash] body_params A customizable set of body.
    # @return [Thinkific::ObjectifiedHash] Information about created CategoryMemberships.
    def add_products_to_category(id, body_params)
      post("/collection_memberships/#{id}", body: body_params)
    end

    # Delete one or more Products from a Category.
    #
    # @example
    #   Thinkific.delete_products_to_category(id, body_params)
    #
    # @param  [Integer] id The ID of a category.
    # @param  [Hash] body_params A customizable set of body.
    # @return [void] This API call returns an empty response categories.
    def delete_products_to_category(id, body_params)
      delete("/collection_memberships/#{id}", body: body_params)
    end
  end
end
