# frozen_string_literal: true

require 'active_support'
require 'active_support/core_ext'
require 'httparty'

require_relative 'thinkific/version'
require_relative 'thinkific/oauth2/exceptions'
require_relative 'thinkific/oauth2/config'
require_relative 'thinkific/oauth2/connection'
require_relative 'thinkific/oauth2'

module Thinkific
  class Error < StandardError; end
  # Your code goes here...
end


module Thinkific
  def self.configure(config={})
    Thinkific::Config.configure(config)
  end

  require 'thinkific/railtie' if defined?(Rails)
end

# Alias the module for those looking to use the stylized name Thinkific
Thinkific = Thinkific
