# frozen_string_literal: true

require "logger"
require "thinkific/connection"

module Thinkific
  class Config
    DEFAULT_LOGGER = Logger.new(nil)
    CONFIG_KEYS = %i[logger base_url client_id client_secret read_timeout open_timeout].freeze

    class << self
      attr_accessor(*CONFIG_KEYS)

      def configure(config)
        config.stringify_keys!
        @logger        = config["logger"] || DEFAULT_LOGGER
        @base_url      = config["base_url"] || "https://api.thinkific.com/api/public/v1"
        @client_id     = config["client_id"] if config["client_id"].present?
        @client_secret = config["client_secret"] if config["client_secret"].present?
        @read_timeout  = config["read_timeout"] || config["timeout"]
        @open_timeout  = config["open_timeout"] || config["timeout"]

        self
      end

      def reset!
        @logger = DEFAULT_LOGGER
        @base_url = "https://api.thinkific.com/api/public/v1"
        Thinkific::Connection.headers({})
      end

      def ensure!(*params)
        params.each do |p|
          raise Thinkific::ConfigurationError, "'#{p}' not configured" unless instance_variable_get "@#{p}"
        end
      end
    end

    reset!
  end
end
