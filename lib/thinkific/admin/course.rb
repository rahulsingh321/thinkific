# frozen_string_literal: true

module Thinkific
  module Admin
    class Course
      class << self
        include Thinkific::Admin::CommonOperations

        def list_chapters(id, params = {})
          path = entity_name(id) + '/chapters'

          response = Thinkific::Connection.make_api_call(:get, path, params)
          return [] unless response["items"].any?

          page_number = 1
          chapters = response["items"]

          while page_number <= response["meta"]["pagination"]["total_pages"]
            page_number += 1
            response = Thinkific::Connection.make_api_call(:get, apply_pagination(path, page_number), params)
            chapters += response["items"]
          end

          chapters
        end
      end
    end
  end
end
