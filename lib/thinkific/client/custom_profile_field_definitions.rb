# frozen_string_literal: true

class Thinkific::Client
  module CustomProfileFieldDefinitions

    # Gets a list of CustomProfileFieldDefinitions owned by the authenticated user.
    #
    # @example
    #   Thinkific.custom_profile_field_definitions
    #
    # @param  [Hash] options A customizable set of options.
    # @option options [Integer] :page The page number.
    # @option options [Integer] :per_page The number of results per page.
    # (Any provided options will be passed to Thinkific. See {https://developers.thinkific.com/api/api-documentation/#/Custom%20Profile%20Field%20Definitions})
    #
    # @return [Array<Thinkific::ObjectifiedHash>]
    def custom_profile_field_definitions(options = {})
      get('/custom_profile_field_definitions', query: options)
    end
  end
end
