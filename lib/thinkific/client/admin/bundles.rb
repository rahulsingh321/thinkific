# frozen_string_literal: true

class Thinkific::Client
  # Defines methods related to avatar.
  # @see https://docs.gitlab.com/ce/api/avatar.html
  module Bundles
    # Gets a list of bundles owned by the authenticated user.
    #
    # @example
    #   Thinkific.bundles
    #
    # @param  [Hash] options A customizable set of options.
    # @option options [Integer] :page The page number.
    # @option options [Integer] :per_page The number of results per page.
    # (Any provided options will be passed to Thinkific. See {https://docs.gitlab.com/ce/api/projects.html#list-all-projects Gitlab docs} for all valid options)
    #
    # @return [Array<Thinkific::ObjectifiedHash>]
    def bundles(options = {})
      get('/bundles', query: options)
    end
  end
end
