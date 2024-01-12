# frozen_string_literal: true

class Thinkific::Client
  module Contents

    # Get a single Contents.
    #
    # @example
    #   Thinkific.content(1)
    #
    # @param  [Integer] id The ID of a Contents.
    # @return [Thinkific::ObjectifiedHash] Returns information about a Contents
    def content(id)
      get("/contents/#{id}")
    end
  end
end
