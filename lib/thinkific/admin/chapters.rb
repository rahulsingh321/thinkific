# frozen_string_literal: true

module Thinkific
  module Admin
    class Chapters
      class << self
        include Thinkific::Admin::CommonOperations

        def list_contents(id, params = {})
          list(id, params, '/contents')
        end
      end
    end
  end
end
