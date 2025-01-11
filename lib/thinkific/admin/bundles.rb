# frozen_string_literal: true

module Thinkific
  module Admin
    class Bundles
      class << self
        include Thinkific::Admin::CommonOperations

        def list_courses(id, params = {})
          list(id, params, '/courses')
        end

        def list_enrollments(id, params = {})
          list(id, params, '/enrollments')
        end

        def create_enrollment(id, params)
          path = entity_name(id, false, "/enrollments")
          process_api_call(:post, path, params)
        end

        def update_enrollment(id, params)
          path = entity_name(id, false, "/enrollments")
          process_api_call(:put, path, params)
        end
      end
    end
  end
end
