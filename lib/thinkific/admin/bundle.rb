# frozen_string_literal: true

module Thinkific
  module Admin
    class Bundle
      class << self
        include Thinkific::Admin::CommonOperations

        def list_courses(id, params = {})
          path = entity_name(id) + "/courses"

          response = Thinkific::Connection.make_api_call(:get, path, params)
          return [] unless response["items"].any?

          page_number = 1
          courses = response["items"]

          while page_number <= response["meta"]["pagination"]["total_pages"]
            page_number += 1
            response = Thinkific::Connection.make_api_call(:get, apply_pagination(path, page_number), params)
            courses += response["items"]
          end

          courses
        end

        def list_enrollments(id, params = {})
          path = entity_name(id) + "/enrollments"

          response = Thinkific::Connection.make_api_call(:get, path, params)
          return [] unless response["items"].any?

          page_number = 1
          enrollments = response["items"]

          while page_number <= response["meta"]["pagination"]["total_pages"]
            page_number += 1
            response = Thinkific::Connection.make_api_call(:get, apply_pagination(path, page_number), params)
            enrollments += response["items"]
          end

          enrollments
        end

        def create_enrollment(id, params)
          path = entity_name(id) + "/enrollments"

          Thinkific::Connection.make_api_call(:post, path, params)
        end

        def update_enrollment(id, params)
          path = entity_name(id) + "/enrollments"

          Thinkific::Connection.make_api_call(:put, path, params)
        end
      end
    end
  end
end
