# frozen_string_literal: true

require 'active_support'
require 'active_support/core_ext'
require 'httparty'


require 'thinkific/version'
require 'thinkific/exceptions'
require 'thinkific/order'
require 'thinkific/config'
require 'thinkific/connection'
require 'thinkific/oauth'


module Thinkific
  class Error < StandardError; end
  # Your code goes here...
end


module Thinkific
  def self.configure(config={})
    Thinkific::Config.configure(config)
  end
end

# Alias the module for those looking to use the stylized name Thinkific
Thinkific = Thinkific
