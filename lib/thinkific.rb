# frozen_string_literal: true

require 'thinkific/version'
require 'thinkific/objectified_hash'
require 'thinkific/configuration'
require 'thinkific/error'
require 'thinkific/paginated_response'
require 'thinkific/request'
require 'thinkific/api'
require 'thinkific/client'


module Thinkific
  extend Configuration

  # Alias for Thinkific::Client.new
  #
  # @return [Thinkific::Client]
  def self.client(options = {})
    Thinkific::Client.new(options)
  end

  if Gem::Version.new(RUBY_VERSION).release >= Gem::Version.new('3.0.0')
    def self.method_missing(method, *args, **keywargs, &block)
      return super unless client.respond_to?(method)

      client.send(method, *args, **keywargs, &block)
    end
  else
    def self.method_missing(method, *args, &block)
      return super unless client.respond_to?(method)

      client.send(method, *args, &block)
    end
  end

  # Delegate to Thinkific::Client
  def self.respond_to_missing?(method_name, include_private = false)
    client.respond_to?(method_name) || super
  end

  # Returns an unsorted array of available client methods.
  #
  # @return [Array<Symbol>]
  def self.actions
    # rubocop:disable Layout/LineLength
    hidden =
      /endpoint|private_token|auth_token|user_agent|sudo|get|post|put|patch|\Adelete\z|validate\z|request_defaults|httparty/
    # rubocop:enable Layout/LineLength
    (Thinkific::Client.instance_methods - Object.methods).reject { |e| e[hidden] }
  end
end
