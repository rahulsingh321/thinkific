# frozen_string_literal: true

class Thinkific::Client
  module Courses

    # Gets a list of Courses owned by the authenticated user.
    #
    # @example
    #   Thinkific.courses
    #
    # @param  [Hash] options A customizable set of options.
    # @option options [Integer] :page The page number.
    # @option options [Integer] :per_page The number of results per page.
    # (Any provided options will be passed to Thinkific. See {https://developers.thinkific.com/api/api-documentation/#/Courses})
    #
    # @return [Array<Thinkific::ObjectifiedHash>]
    def courses(options = {})
      get('/courses', query: options)
    end

    # Get a single Course.
    #
    # @example
    #   Thinkific.course(1)
    #
    # @param  [Integer] id The ID of a Course.
    # @return [Thinkific::ObjectifiedHash] Returns information about a Course
    def course(id)
      get("/courses/#{id}")
    end

    # Gets chapters lists by a course_id
    #
    # @example
    #   Thinkific.course_chapter_lists(1)
    #
    # @param  [Integer] id The ID of a Course.
    # @return [Array<Thinkific::ObjectifiedHash>]
    def course_chapter_lists(id)
      get("/courses/#{id}/chapters")
    end
  end
end
