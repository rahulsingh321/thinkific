# frozen_string_literal: true

class Thinkific::Client
  module Groups

    # Gets a list of Groups owned by the authenticated user.
    #
    # @example
    #   Thinkific.groups
    #
    # @param  [Hash] options A customizable set of options.
    # @option options [Integer] :page The page number.
    # @option options [Integer] :per_page The number of results per page.
    # (Any provided options will be passed to Thinkific. See {https://developers.thinkific.com/api/api-documentation/#/Groups})
    #
    # @return [Array<Thinkific::ObjectifiedHash>]
    def groups(options = {})
      get('/groups', query: options)
    end

    # Get a single Group.
    #
    # @example
    #   Thinkific.group(1)
    #
    # @param  [Integer] id The ID of a Group.
    # @return [Thinkific::ObjectifiedHash] Returns information about a Group
    def group(id)
      get("/groups/#{id}")
    end

    # Creates a new groups.
    #
    # @example
    #   Thinkific.create_groups(body_params)
    #
    # @param  [Hash] body_params A customizable set of body.
    # @return [Thinkific::ObjectifiedHash] Information about created Groups.
    def create_groups(body_params)
      post("/groups", body: body_params)
    end

    # Deletes a Groups.
    #
    # @example
    #   Thinkific.delete_groups(1)
    #
    # @param  [Integer] id The ID of a Groups.
    # @return [void] This API call returns an empty response Groups.
    def delete_groups(id)
      delete("/groups/#{id}")
    end

    # Retrieves a list of group analysts
    #
    # @example
    #   Thinkific.groups_analyst_lists(1)
    #
    # @param  [Integer] id The ID of a Group.
    # @param  [Hash] options A customizable set of options.
    # (Any provided options will be passed to Thinkific. See {https://docs.Thinkific.com/ce/api/projects.html#list-all-projects Thinkific docs} for all valid options)
    #
    # @return [Array<Thinkific::ObjectifiedHash>]
    def groups_analyst_lists(group_id, options = {})
      get("/groups/#{group_id}/analysts", query: options)
    end

    # Assign Group Analysts to a group.
    #
    # @example
    #   Thinkific.assign_analyst_to_group(1, body_params)
    #
    # @param  [Integer] group_id The ID of a Group.
    # @param  [Hash] body_params A customizable set of body.
    # @return [Thinkific::ObjectifiedHash] Information about created Groups.
    def assign_analyst_to_group(group_id, body_params)
      post("/groups/#{group_id}/analysts", body: body_params)
    end

    # Remove an analyst from a group
    #
    # @example
    #   Thinkific.remove_analyst_from_group(1, 1)
    #
    # @param  [Integer] group_id The ID of a Group.
    # @param  [Integer] user_id The ID of a User.
    # @return [void] This API call returns an empty response Groups.
    def remove_analyst_from_group(group_id, user_id)
      delete("/groups/#{group_id}/analysts/#{user_id}")
    end
  end
end
