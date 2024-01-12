# frozen_string_literal: true

class Thinkific::Client
  module Instructors

    # Gets a list of Instructors owned by the authenticated user.
    #
    # @example
    #   Thinkific.instructors
    #
    # @param  [Hash] options A customizable set of options.
    # @option options [Integer] :page The page number.
    # @option options [Integer] :per_page The number of results per page.
    # (Any provided options will be passed to Thinkific. See {https://developers.thinkific.com/api/api-documentation/#/Instructors})
    #
    # @return [Array<Thinkific::ObjectifiedHash>]
    def instructors(options = {})
      get('/instructors', query: options)
    end

    # Get a single Instructors.
    #
    # @example
    #   Thinkific.instructor(1)
    #
    # @param  [Integer] id The ID of a Instructors.
    # @return [Thinkific::ObjectifiedHash] Returns information about a Instructors
    def instructor(id)
      get("/instructors/#{id}")
    end

    # Creates a new Instructors.
    #
    # @example
    #   Thinkific.create_instructors(body_params)
    #
    # @param  [Hash] body_params A customizable set of body.
    # @return [Thinkific::ObjectifiedHash] Information about created Instructors.
    def create_instructors(body_params)
      post("/instructors", body: body_params)
    end

    # Updates a Instructors.
    #
    # @example
    #   Thinkific.edit_instructors(1, edit_params)
    #
    # @param  [Integer] id The ID of a Instructors.
    # @param  [Hash] edit_params A customizable set of body.
    # @return [Thinkific::ObjectifiedHash] Information about updated Instructors.
    def edit_instructors(id, edit_params = {})
      put("/instructors/#{id}", body: edit_params)
    end

    # Deletes a Instructors.
    #
    # @example
    #   Thinkific.delete_instructors(1)
    #
    # @param  [Integer] id The ID of a Instructors.
    # @return [void] This API call returns an empty response Instructors.
    def delete_instructors(id)
      delete("/instructors/#{id}")
    end
  end
end
