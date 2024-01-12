# frozen_string_literal: true

class Thinkific::Client
  module GroupUsers
    # Create an existing User to existing Groups
    #
    # @example
    #   Thinkific.create_group_users(body_params)
    #
    # @param  [Hash] body_params A customizable set of body.
    # @return [Thinkific::ObjectifiedHash] Information about created Group Users.
    def create_group_users(body_params)
      post("/group_users", body: body_params)
    end
  end
end
