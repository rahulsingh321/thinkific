# frozen_string_literal: true

class Thinkific::Client
  module Chapters

    # Get a single Chapters.
    #
    # @example
    #   Thinkific.chapter(1)
    #
    # @param  [Integer] id The ID of a Chapters.
    # @return [Thinkific::ObjectifiedHash] Returns information about a Chapters
    def chapter(id)
      get("/chapters/#{id}")
    end


    # Gets content lists by a chapters_id
    #
    # @example
    #   Thinkific.chapters_content_lists(1)
    #
    # @param  [Integer] id The ID of a chapters.
    # @return [Array<Thinkific::ObjectifiedHash>]
    def chapters_content_lists(id)
      get("/chapters/#{id}/contents")
    end
  end
end
