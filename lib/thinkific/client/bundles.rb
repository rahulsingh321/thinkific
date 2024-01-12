# frozen_string_literal: true

class Thinkific::Client

  module Bundles
    # Gets a list of bundles owned by the authenticated user.
    #
    # @example
    #   Thinkific.bundles
    #
    # @param  [Hash] options A customizable set of options.
    # @option options [Integer] :page The page number.
    # @option options [Integer] :per_page The number of results per page.
    # (Any provided options will be passed to Thinkific. See {https://developers.thinkific.com/api/api-documentation/#/Bundles} for all valid options)
    #
    # @return [Array<Thinkific::ObjectifiedHash>]
    def bundles(options = {})
      get('/bundles', query: options)
    end
  end
end
