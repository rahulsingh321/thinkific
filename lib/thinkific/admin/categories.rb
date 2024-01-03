# frozen_string_literal: true

module Thinkific
  module Admin
    class Categories
      class << self
        include Thinkific::Admin::CommonOperations

        def list_products(id, params = {})
          params[:custom_path] = '/products'
          list(id, params)
        end

        def name
          'Collection'
        end
      end
    end
  end
end
