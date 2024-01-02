# frozen_string_literal: true

module Thinkific
  module Admin
    class Product
      class << self
        include Thinkific::Admin::CommonOperations

        def list_related(id, params = {})
          path = entity_name(id) + '/related'

          response = Thinkific::Connection.make_api_call(:get, path, params)
          return [] unless response["items"].any?

          page_number = 1
          products = response["items"]

          while page_number <= response["meta"]["pagination"]["total_pages"]
            page_number += 1
            response = Thinkific::Connection.make_api_call(:get, apply_pagination(path, page_number), params)
            products += response["items"]
          end

          products
        end
      end
    end
  end
end
