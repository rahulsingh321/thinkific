# frozen_string_literal: true

class Thinkific::Client
  module CourseReviews

    # Gets a list of CourseReviews owned by the authenticated user.
    #
    # @example
    #   Thinkific.course_reviews
    #
    # @param  [Hash] options A customizable set of options.
    # @option options [Integer] :page The page number.
    # @option options [Integer] :per_page The number of results per page.
    # (Any provided options will be passed to Thinkific. See {https://developers.thinkific.com/api/api-documentation/#/Course%20Reviews})
    #
    # @return [Array<Thinkific::ObjectifiedHash>]
    def course_reviews(options = {})
      get('/course_reviews', query: options)
    end

    # Get a single CourseReview.
    #
    # @example
    #   Thinkific.course_review(1)
    #
    # @param  [Integer] id The ID of a CourseReview.
    # @return [Thinkific::ObjectifiedHash] Returns information about a CourseReview
    def course_review(id)
      get("/course_reviews/#{id}")
    end

    # Creates a new CourseReviews.
    #
    # @example
    #   Thinkific.create_course_reviews(body_params)
    #
    # @param  [Hash] body_params A customizable set of body.
    # @return [Thinkific::ObjectifiedHash] Information about created CourseReviews.
    def create_course_reviews(body_params)
      post("/course_reviews", body: body_params)
    end
  end
end
