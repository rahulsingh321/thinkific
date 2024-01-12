# frozen_string_literal: true

class Thinkific::Client
  module GroupAnalysts

    # Assign Group Analyst to groups. User need to be assigned the Group Analyst (group_analyst) role.
    #
    # @example
    #   Thinkific.add_analyst_to_groups(1, body_params)
    #
    # @param  [Integer] user_id The ID of a User.
    # @param  [Hash] body_params A customizable set of body.
    # @return [Thinkific::ObjectifiedHash] Information about created Group Analyst.
    def add_analyst_to_groups(user_id, body_params)
      post("/group_analysts/#{user_id}/groups", body: body_params)
    end

    # Remove an analyst from a group
    #
    # @example
    #   Thinkific.remove_analyst_from_groups(1, 1, body_params)
    #
    # @param  [Integer] user_id The ID of a User.
    # @param  [Integer] group_id The ID of a Group.
    # @param  [Hash] body_params A customizable set of body.
    # @return [void] This API call returns an empty response Group Analyst.
    def remove_analyst_from_groups(user_id, group_id, body_params)
      post("/group_analysts/#{user_id}/groups/#{group_id}", body: body_params)
    end
  end
end
