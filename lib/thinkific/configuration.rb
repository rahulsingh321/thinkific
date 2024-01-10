# frozen_string_literal: true

module Thinkific
  # Defines constants and methods related to configuration.
  module Configuration
    # An array of valid keys in the options hash when configuring a Gitlab::API.
    VALID_OPTIONS_KEYS = %i[endpoint api_key client_id client_secret httparty].freeze

    # @private
    attr_accessor(*VALID_OPTIONS_KEYS)
    # @private
    alias access_token= api_key=

    # Sets all configuration options to their default values
    # when this module is extended.
    def self.extended(base)
      base.reset
    end

    # Convenience method to allow configuration options to be set in a block.
    def configure
      yield self
    end

    # Creates a hash of options and their values.
    def options
      VALID_OPTIONS_KEYS.inject({}) do |option, key|
        option.merge!(key => send(key))
      end
    end

    # Resets all configuration options to the defaults.
    def reset
      self.endpoint       = ENV['THINKIFIC_API_ENDPOINT'] || 'https://api.thinkific.com/api/public/v1'
      self.api_key        = ENV['THINKIFIC_API_KEY']
      self.httparty       = get_httparty_config(ENV['THINKIFIC_API_HTTPARTY_OPTIONS'])

      self.client_id      = ENV['THINKIFIC_CLIENT_ID']
      self.client_secret  = ENV['THINKIFIC_CLIENT_SECRET']
    end

    private

    # Allows HTTParty config to be specified in ENV using YAML hash.
    def get_httparty_config(options)
      return if options.nil?

      httparty = Thinkific::Helpers.yaml_load(options)
      raise ArgumentError, 'HTTParty config should be a Hash.' unless httparty.is_a? Hash

      Thinkific::Helpers.symbolize_keys httparty
    end
  end
end
