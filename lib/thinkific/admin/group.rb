# frozen_string_literal: true

module Thinkific
  module Admin
    class Group
      class << self
        include Thinkific::Admin::CommonOperations

        def list_analysts(id, params = {})
          params[:custom_path] = '/analysts'
          list(id, params)
        end

        def create_analysts(id, params)
          path = entity_name(id) + "/analysts"
          process_api_call(:post, path, params)
        end

        def delete_analyst
          path = entity_name(id) + "/analysts"
          process_api_call(:delete, path, params)
        end
      end
    end
  end
end
