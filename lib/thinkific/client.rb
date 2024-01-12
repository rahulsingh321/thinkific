# frozen_string_literal: true

module Thinkific
  # Wrapper for the Thinkific REST API.
  class Client < API
    Dir[File.expand_path('client/*.rb', __dir__)].each { |f| require f }

    # Please keep in alphabetical order
    include Bundles
    include Categories
    include CategoryMemberships
    include Chapters
    include Contents
    include Coupons
    include CourseReviews
    include Courses
    include CustomProfileFieldDefinitions
    include Enrollments
    include ExternalOrders
    include GroupAnalysts
    include Groups
    include GroupUsers
    include Instructors
    include Orders
    include ProductPublishRequests
    include Products
    include Promotions
    include SiteScripts
    include Users

    # Text representation of the client, masking private token.
    #
    # @return [String]
    def inspect
      inspected = super
      inspected.sub! @private_token, only_show_last_four_chars(@private_token) if @private_token
      inspected
    end

    # Utility method for URL encoding of a string.
    # Copied from https://ruby-doc.org/stdlib-2.7.0/libdoc/erb/rdoc/ERB/Util.html
    #
    # @return [String]
    def url_encode(url)
      url.to_s.b.gsub(/[^a-zA-Z0-9_\-.~]/n) { |m| sprintf('%%%02X', m.unpack1('C')) } # rubocop:disable Style/FormatString
    end

    private

    def only_show_last_four_chars(token)
      "#{'*' * (token.size - 4)}#{token[-4..]}"
    end
  end
end
