# frozen_string_literal: true

module Thinkific
  module Admin
    class Chapter
      class << self
        include Thinkific::Admin::CommonOperations

        def list_contents(id, params = {})
          path = entity_name(id) + '/contents'

          response = Thinkific::Connection.make_api_call(:get, path, params)
          return [] unless response["items"].any?

          page_number = 1
          contents = response["items"]

          while page_number <= response["meta"]["pagination"]["total_pages"]
            page_number += 1
            response = Thinkific::Connection.make_api_call(:get, apply_pagination(path, page_number), params)
            contents += response["items"]
          end

          contents
        end
      end
    end
  end
end
