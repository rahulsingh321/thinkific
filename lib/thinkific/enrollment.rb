module Thinkific
  #
  # Thinkific Admin Enrollment API
  #
  # {https://developers.thinkific.com/api/api-documentation/#/Enrollments}
  #
  class Enrollment
    PER_PAGE = 250
    ENROLLMENTS_PATH = "/enrollments?query[completed]=true"

    class << self
      # {https://developers.thinkific.com/api/api-documentation/#/Enrollments/getEnrollments}
      def all(opts = {})
        path = endpoint
        opts = opts

        response = Thinkific::Connection.get_json(path, opts)
        return [] unless response["items"].any?

        page_number = 1
        enrollments = response["items"]

        while page_number <= response["meta"]["pagination"]["total_pages"]
          page_number += 1
          response = Thinkific::Connection.get_json(endpoint(page_number), opts)
          enrollments += response["items"]
        end

        enrollments
      end

      def endpoint(page_number = 1)
        ENROLLMENTS_PATH + "&page=#{page_number}&limit=#{PER_PAGE}"
      end
    end
  end
end
