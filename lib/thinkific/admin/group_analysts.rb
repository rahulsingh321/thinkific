# frozen_string_literal: true

module Thinkific
  module Admin
    class GroupAnalysts
      class << self
        include Thinkific::Admin::CommonOperations

        def create_groups(user_id, params)
          path = entity_name(user_id) + '/groups'
          process_api_call(:post, path, params)
        end

        def delete_analyst(user_id, group_id)
          path = entity_name(user_id) + "/groups/#{group_id}"
          process_api_call(:delete, path, params)
        end
      end
    end
  end
end
