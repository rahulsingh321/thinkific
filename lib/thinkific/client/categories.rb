# frozen_string_literal: true

class Thinkific::Client
  module Categories

    # Gets a list of Categories owned by the authenticated user.
    #
    # @example
    #   Thinkific.Categories
    #
    # @param  [Hash] options A customizable set of options.
    # @option options [Integer] :page The page number.
    # @option options [Integer] :per_page The number of results per page.
    # (Any provided options will be passed to Thinkific. See {https://developers.thinkific.com/api/api-documentation/#/Categories})
    #
    # @return [Array<Thinkific::ObjectifiedHash>]
    def categories(options = {})
      get('/collections', query: options)
    end

    # Get a single Category.
    #
    # @example
    #   Thinkific.category(1)
    #
    # @param  [Integer] id The ID of a category.
    # @return [Thinkific::ObjectifiedHash] Returns information about a Category
    def category(id)
      get("/collections/#{id}")
    end

    # Creates a new categories.
    #
    # @example
    #   Thinkific.create_categories(body_params)
    #
    # @param  [Hash] body_params A customizable set of body.
    # @return [Thinkific::ObjectifiedHash] Information about created categories.
    def create_categories(body_params)
      post("/collections", body: body_params)
    end

    # Updates a categories.
    #
    # @example
    #   Thinkific.edit_categories(1, edit_params)
    #
    # @param  [Integer] id The ID of a categories.
    # @param  [Hash] edit_params A customizable set of body.
    # @return [Thinkific::ObjectifiedHash] Information about updated categories.
    def edit_categories(id, edit_params = {})
      put("/collections/#{id}", body: edit_params)
    end

    # Deletes a categories.
    #
    # @example
    #   Thinkific.delete_categories(1)
    #
    # @param  [Integer] id The ID of a categories.
    # @return [void] This API call returns an empty response categories.
    def delete_categories(id)
      delete("/collections/#{id}")
    end

    # Gets product lists by a categories_id
    #
    # @example
    #   Thinkific.categories_product_lists(1)
    #
    # @param  [Integer] id The ID of a categories.
    # @return [Array<Thinkific::ObjectifiedHash>]
    def categories_product_lists(id)
      get("/collections/#{id}/products")
    end
  end
end
