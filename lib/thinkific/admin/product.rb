# frozen_string_literal: true

module Thinkific
  module Admin
    class Product
      class << self
        include Thinkific::Admin::CommonOperations

        def list_related(id, params = {})
          params[:custom_path] = '/related'
          list(id, params)
        end
      end
    end
  end
end
