module Thinkific
  #
  # Thinkific Admin Enrollment API
  #
  # {https://developers.thinkific.com/api/api-documentation/#/Enrollments}
  #
  class Enrollment
    class << self

      # {https://developers.thinkific.com/api/api-documentation/#/Enrollments/getEnrollments}
      def all(opts = {})
        path, opts = [enrollment_path, opts]

        response = Thinkific::Connection.get_json(path, opts)

        enrollments = []
        page_number = 1

        while page_number <= response['meta']['pagination']['total_pages']
          response = Thinkific::Connection.get_json(enrollment_path(page_number), opts)
          enrollments << response['items']
          page_number += 1
        end

        return enrollments.flatten
      end

      def enrollment_path(page_number = 1)
        "/enrollments?page=#{page_number}&limit=250&query[completed]=true"
      end
    end
  end
end
