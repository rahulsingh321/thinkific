module Thinkific
  class Connection
    include HTTParty

    class << self

      protected

      def read_timeout(opts = {})
        opts.delete(:read_timeout) || Thinkific::Config.read_timeout
      end

      def open_timeout(opts = {})
        opts.delete(:open_timeout) || Thinkific::Config.open_timeout
      end

      def handle_response(response)
        if response.success?
          response.parsed_response
        else
          raise(Thinkific::RequestError.new(response))
        end
      end

      def log_request_and_response(uri, response, body=nil)
        Thinkific::Config.logger.info "Thinkific: #{uri}.\nBody: #{body}.\nResponse: #{response.code} #{response.body}"
      end

    end
  end
end
