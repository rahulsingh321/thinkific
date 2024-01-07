# frozen_string_literal: true

module Thinkific
  module Admin
    class Bundles
      class << self
        include Thinkific::Admin::CommonOperations

        def list_courses(id, params = {})
          path = entity_name(id) + "/courses"
          list(id, params)
        end

        def list_enrollments(id, params = {})
          path = entity_name(id) + "/enrollments"
          list(id, params)
        end

        def create_enrollment(id, params)
          path = entity_name(id) + "/enrollments"
          process_api_call(:post, path, params)
        end

        def update_enrollment(id, params)
          path = entity_name(id) + "/enrollments"
          process_api_call(:put, path, params)
        end
      end
    end
  end
end
