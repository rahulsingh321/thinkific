module Thinkific
  #
  # Thinkific Admin Enrollment API
  #
  # {https://developers.thinkific.com/api/api-documentation/#/Enrollments}
  #
  class Enrollment
    ENROLLMENTS_PATH  = '/enrollments?query[completed]=true'

    class << self

      # {https://developers.thinkific.com/api/api-documentation/#/Enrollments/getEnrollments}
      def all(opts = {})
        path, opts = [ENROLLMENTS_PATH, opts]

        response = Thinkific::Connection.get_json(path, opts)
        response['items']
      end

    end
  end
end
