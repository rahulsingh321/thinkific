# frozen_string_literal: true

module Thinkific
  module Admin
    class Categories
      class << self
        include Thinkific::Admin::CommonOperations

        def list_products(id, params = {})
          list(id, params, '/products')
        end

        def name
          'Collections'
        end
      end
    end
  end
end
