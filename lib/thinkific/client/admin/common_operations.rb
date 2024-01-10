# frozen_string_literal: true

module Thinkific
  module Admin
    module CommonOperations
      extend ActiveSupport::Concern
      include Thinkific::Admin::Base

      mattr_reader :params

      def list(id = nil, params = {})
        @@params = params.with_indifferent_access
        path     = entity_name(id, true)

        process_api_call(:get, path, params)
      end

      def show(id)
        path = entity_name(id)
        process_api_call(:get, path)
      end

      def create(params)
        path = entity_name
        process_api_call(:post, path, params)
      end

      def update(id, params)
        path = entity_name(id)
        process_api_call(:put, path, params)
      end

      def delete(id)
        path = entity_name(id)
        process_api_call(:delete, path)
      end
    end
  end
end
