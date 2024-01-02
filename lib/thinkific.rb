# frozen_string_literal: true

require "httparty"

require "thinkific/version"
require "thinkific/exceptions"
require "thinkific/config"
require "thinkific/connection"

require "thinkific/admin/base"
require "thinkific/admin/common_operations"
require "thinkific/admin/bundles"
require "thinkific/admin/categories"
require "thinkific/admin/category_memberships"
require "thinkific/admin/chapters"
require "thinkific/admin/contents"
require "thinkific/admin/coupons"
require "thinkific/admin/courses"
require "thinkific/admin/course_reviews"
require "thinkific/admin/custom_profile_field_definitions"
require "thinkific/admin/enrollments"
require "thinkific/admin/external_orders"
require "thinkific/admin/groups"
require "thinkific/admin/group_analysts"
require "thinkific/admin/group_users"
require "thinkific/admin/instructors"
require "thinkific/admin/orders"
require "thinkific/admin/products"
require "thinkific/admin/product_publish_requests"
require "thinkific/admin/promotions"
require "thinkific/admin/site_scripts"
require "thinkific/admin/users"
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
