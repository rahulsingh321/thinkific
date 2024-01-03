# frozen_string_literal: true

require "httparty"

require "thinkific/version"
require "thinkific/exceptions"
require "thinkific/config"
require "thinkific/connection"

require "thinkific/admin/common_operations"
require "thinkific/admin/bundle"
require "thinkific/admin/categories"
require "thinkific/admin/category_membership"
require "thinkific/admin/chapter"
require "thinkific/admin/content"
require "thinkific/admin/coupon"
require "thinkific/admin/course"
require "thinkific/admin/course_review"
require "thinkific/admin/custom_profile_field_definition"
require "thinkific/admin/enrollment"
require "thinkific/admin/external_order"
require "thinkific/admin/group"
require "thinkific/admin/group_analyst"
require "thinkific/admin/group_user"
require "thinkific/admin/instructor"
require "thinkific/admin/order"
require "thinkific/admin/product"
require "thinkific/admin/product_publish_request"
require "thinkific/admin/promotion"
require "thinkific/admin/site_script"
require "thinkific/admin/user"

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
