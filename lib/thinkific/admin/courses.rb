# frozen_string_literal: true

module Thinkific
  module Admin
    class Courses
      class << self
        include Thinkific::Admin::CommonOperations

        def list_chapters(id, params = {})
          params[:custom_path] = '/chapters'
          list(id, params, '/chapters')
        end
      end
    end
  end
end
