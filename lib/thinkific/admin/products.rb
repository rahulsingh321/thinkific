# frozen_string_literal: true

module Thinkific
  module Admin
    class Products
      class << self
        include Thinkific::Admin::CommonOperations

        def list_related(id, params = {})
          list(id, params, '/related')
        end
      end
    end
  end
end
