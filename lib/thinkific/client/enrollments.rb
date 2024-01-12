# frozen_string_literal: true

class Thinkific::Client
  module Enrollments

    # Gets a list of Enrollments owned by the authenticated user.
    #
    # @example
    #   Thinkific.enrollments
    #
    # @param  [Hash] options A customizable set of options.
    # @option options [Integer] :page The page number.
    # @option options [Integer] :per_page The number of results per page.
    # (Any provided options will be passed to Thinkific. See {https://developers.thinkific.com/api/api-documentation/#/Enrollments})
    #
    # @return [Array<Thinkific::ObjectifiedHash>]
    def enrollments(options = {})
      get('/enrollments', query: options)
    end

    # Get a single Enrollments.
    #
    # @example
    #   Thinkific.enrollment(1)
    #
    # @param  [Integer] id The ID of a Enrollment.
    # @return [Thinkific::ObjectifiedHash] Returns information about a Enrollments
    def enrollment(id)
      get("/enrollments/#{id}")
    end

    # Creates a new Enrollments.
    #
    # @example
    #   Thinkific.create_enrollments(body_params)
    #
    # @param  [Hash] body_params A customizable set of body.
    # @return [Thinkific::ObjectifiedHash] Information about created Enrollments.
    def create_enrollments(body_params)
      post("/enrollments", body: body_params)
    end

    # Updates a Enrollments.
    #
    # @example
    #   Thinkific.edit_enrollments(1, edit_params)
    #
    # @param  [Integer] id The ID of a Enrollments.
    # @param  [Hash] edit_params A customizable set of body.
    # @return [Thinkific::ObjectifiedHash] Information about updated Enrollments.
    def edit_enrollments(id, edit_params = {})
      put("/enrollments/#{id}", body: edit_params)
    end
  end
end
