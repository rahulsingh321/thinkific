# frozen_string_literal: true

module Thinkific
  # @private
  class API < Request
    # @private
    attr_accessor(*Configuration::VALID_OPTIONS_KEYS)
    # @private
    alias auth_token= private_token=

    # Creates a new API.
    # @raise [Error:MissingCredentials]
    # rubocop:disable Lint/MissingSuper
    def initialize(options = {})
      options = Thinkific.options.merge(options)
      (Configuration::VALID_OPTIONS_KEYS + [:auth_token]).each do |key|
        send("#{key}=", options[key]) if options[key]
      end
      request_defaults(sudo)
    end
    # rubocop:enable Lint/MissingSuper
  end
end
