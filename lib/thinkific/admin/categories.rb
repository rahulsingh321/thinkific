# frozen_string_literal: true

module Thinkific
  module Admin
    class Categories
      class << self
        include Thinkific::Admin::CommonOperations

        def list_products(id, params = {})
          path = entity_name(id) + '/products'

          response = Thinkific::Connection.make_api_call(:get, path, params)
          return [] unless response["items"].any?

          page_number = 1
          categories = response["items"]

          while page_number <= response["meta"]["pagination"]["total_pages"]
            page_number += 1
            response = Thinkific::Connection.make_api_call(:get, apply_pagination(path, page_number), params)
            categories += response["items"]
          end

          categories
        end
      end
    end
  end
end
