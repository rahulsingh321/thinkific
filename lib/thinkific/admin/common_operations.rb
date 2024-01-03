# frozen_string_literal: true

module Thinkific
  module Admin
    module CommonOperations
      extend ActiveSupport::Concern

      DEFAULT_PER_PAGE = 250

      def all(opts = {})
        path = entity_name
        opts = opts.with_indifferent_access

        response = Thinkific::Connection.make_api_call(:get, apply_pagination(path), opts)
        return [] unless response["items"].any?

        page_number = 1
        records = response["items"]
        while page_number <= response["meta"]["pagination"]["total_pages"]
          page_number += 1
          response = Thinkific::Connection.make_api_call(:get, apply_pagination(path, page_number), opts)
          records += response["items"]
        end

        records
      end

      def find_by_id(id)
        path = entity_name(id)

        Thinkific::Connection.make_api_call(:get, path, {})
      end

      def create(params)
        path = entity_name

        Thinkific::Connection.make_api_call(:post, path, params)
      end

      def update(id, params)
        path = entity_name(id)

        Thinkific::Connection.make_api_call(:put, path, params)
      end

      def delete(id, _params = {})
        path = entity_name(id)

        Thinkific::Connection.make_api_call(:delete, path, param)
      end

      def entity_name(id = nil)
        class_name = name.split("::").last.tableize
        class_name = class_names[class_name] || class_name

        id.present? ? "/#{class_name}/#{id}" : "/#{class_name}"
      end

      def class_names
        { "categories" => "collections", "category_memberships" => "collection_memberships" }
      end

      def apply_pagination(path, page_number = 1, params = {})
        page_number = params[:page_number] || page_number
        per_page	= params[:per_page] || DEFAULT_PER_PAGE
        query	= params[:query]

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
