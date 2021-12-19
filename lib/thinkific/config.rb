require 'logger'
require 'connection'

module Thinkific
  class Config

    CONFIG_KEYS = [
      :logger, :access_token, :client_id, :client_secret,
      :redirect_uri, :read_timeout, :open_timeout
    ]

    DEFAULT_LOGGER = Logger.new(nil)

    class << self
      attr_accessor *CONFIG_KEYS

      def configure(config)
        config.stringify_keys!
        @logger = config['logger'] || DEFAULT_LOGGER
        @access_token = config['access_token']
        @client_id = config['client_id'] if config['client_id'].present?
        @client_secret = config['client_secret'] if config['client_secret'].present?
        @redirect_uri = config['redirect_uri'] if config['redirect_uri'].present?
        @read_timeout = config['read_timeout'] || config['timeout']
        @open_timeout = config['open_timeout'] || config['timeout']

        unless access_token.present?
          Thinkific::ConfigurationError.new('You must provide an access_token!')
        end

        if access_token.present?
          Thinkific::Connection.headers('Authorization' => "Bearer #{access_token}")
        end

        self
      end

      def reset!
        @logger = DEFAULT_LOGGER
        @access_token = nil
        Thinkific::Connection.headers({})
      end

      def ensure!(*params)
        params.each do |p|
          raise Thinkific::ConfigurationError.new("'#{p}' not configured") unless instance_variable_get "@#{p}"
        end
      end
    end

    reset!
  end
end
