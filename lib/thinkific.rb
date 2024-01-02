# frozen_string_literal: true

require "httparty"

require "thinkific/version"
require "thinkific/exceptions"
require "thinkific/config"
require "thinkific/connection"

require "thinkific/admin/order"
require "thinkific/admin/enrollment"
require "thinkific/oauth/request"


module Thinkific
  class Error < StandardError; end
  # Your code goes here...
end

module Thinkific
  def self.configure(config = {})
    Thinkific::Config.configure(config)
  end
end

# Alias the module for those looking to use the stylized name Thinkific
Thinkific = Thinkific
