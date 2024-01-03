# frozen_string_literal: true

module Thinkific
  module Admin
    class Group
      class << self
        include Thinkific::Admin::CommonOperations

        def list_analysts(id, params = {})
          path = entity_name(id) + "/analysts"

          return [] unless response["items"].any?

          page_number = 1
          analysts = response["items"]

          while page_number <= response["meta"]["pagination"]["total_pages"]
            page_number += 1
            response = Thinkific::Connection.make_api_call(:get, apply_pagination(path, page_number), params)
            analysts += response["items"]
          end

          analysts
        end

        def create_analysts(id, params)
          path = entity_name(id) + "/analysts"

          Thinkific::Connection.make_api_call(:post, path, params)
        end

        def delete_analyst
          path = entity_name(id) + "/analysts"

          Thinkific::Connection.make_api_call(:delete, path, params)
        end
      end
    end
  end
end
