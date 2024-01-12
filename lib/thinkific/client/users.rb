# frozen_string_literal: true

class Thinkific::Client
  module Users

    # Gets a list of Users owned by the authenticated user.
    #
    # @example
    #   Thinkific.users
    #
    # @param  [Hash] options A customizable set of options.
    # @option options [Integer] :page The page number.
    # @option options [Integer] :per_page The number of results per page.
    # (Any provided options will be passed to Thinkific. See {https://developers.thinkific.com/api/api-documentation/#/Users})
    #
    # @return [Array<Thinkific::ObjectifiedHash>]
    def users(options = {})
      get('/users', query: options)
    end

    # Get a single Users.
    #
    # @example
    #   Thinkific.user(1)
    #
    # @param  [Integer] id The ID of a Users.
    # @return [Thinkific::ObjectifiedHash] Returns information about a Users
    def user(id)
      get("/users/#{id}")
    end

    # Creates a new Users.
    #
    # @example
    #   Thinkific.create_users(body_params)
    #
    # @param  [Hash] body_params A customizable set of body.
    # @return [Thinkific::ObjectifiedHash] Information about created Users.
    def create_users(body_params)
      post("/users", body: body_params)
    end

    # Updates a Users.
    #
    # @example
    #   Thinkific.edit_users(1, edit_params)
    #
    # @param  [Integer] id The ID of a Users.
    # @param  [Hash] edit_params A customizable set of body.
    # @return [Thinkific::ObjectifiedHash] Information about updated Users.
    def edit_users(id, edit_params = {})
      put("/users/#{id}", body: edit_params)
    end

    # Deletes a Users.
    #
    # @example
    #   Thinkific.delete_users(1)
    #
    # @param  [Integer] id The ID of a Users.
    # @return [void] This API call returns an empty response Users.
    def delete_users(id)
      delete("/users/#{id}")
    end

    # Retrieves a User authentication data identified by the id and provider.
    #
    # @example
    #   Thinkific.user_authentications(1, 'SSO')
    #
    # @param  [Integer] id The ID of a Users.
    # @param  [string] provider select anyone from Available values : SSO, OPENID_CONNECT.
    # @return [Thinkific::ObjectifiedHash] Returns information about a Users
    def user_authentications(id, provider)
      get("/users/#{id}/authentications/#{provider}")
    end
  end
end
