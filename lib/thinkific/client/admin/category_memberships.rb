# frozen_string_literal: true

module Thinkific
  module Admin
    class CategoryMemberships
      class << self
        include Thinkific::Admin::CommonOperations

        def create_products(id, params)
          path = entity_name(id)
          process_api_call(:post, path, params)
        end

        def delete_products(id, params)
          path = entity_name(id)
          process_api_call(:delete, path, params)
        end

        def name
          'CollectionMemberships'
        end
      end
    end
  end
end
