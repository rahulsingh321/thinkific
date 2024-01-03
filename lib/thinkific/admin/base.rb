# frozen_string_literal: true

module Thinkific
  module Admin
    module Base
      extend ActiveSupport::Concern

      def process_api_call(action, path, params={})
        Thinkific::Connection.make_api_call(action, path, params)
      end

      def entity_name(id = nil, index = false)
        # retrieve path from class name
        path = name.split("::").last.tableize
        path = id.present? ? "/#{path}/#{id}" : "/#{path}"

        # initialize custom path
        path = path + (params[:custom_path] || '')

        return apply_pagination(path) if index

        path
      end

      def apply_pagination(path)
        query	      = params[:query]
        per_page	  = params[:per_page] || 25
        page_number = params[:page_number] || 1

        path += "?page=#{page_number}&limit=#{per_page}"

        if query.present?
          query.each do |key, value|
            path += "&query%5B#{key}%5D=#{value}"
          end
        end

        path
      end
    end
  end
end
