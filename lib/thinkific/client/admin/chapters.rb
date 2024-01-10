# frozen_string_literal: true

module Thinkific
  module Admin
    class Chapters
      class << self
        include Thinkific::Admin::CommonOperations

        def list_contents(id, params = {})
          params[:custom_path] = '/contents'
          list(id, params)
        end
      end
    end
  end
end
