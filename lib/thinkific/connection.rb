# frozen_string_literal: true

module Thinkific
  class Connection
    include HTTParty

    class << self
      def make_api_call(action_name, path, opts)
        url      = generate_url(action_name, path, opts)
        response = public_send(action_name, url, body: opts.to_json, format: :json, read_timeout: read_timeout(opts),
                                                 open_timeout: open_timeout(opts))
        log_request_and_response url, response

        raise Thinkific::RequestError, response unless response.success?

        response.parsed_response
      end

      protected

      def read_timeout(opts = {})
        opts.delete(:read_timeout) || Thinkific::Config.read_timeout
      end

      def open_timeout(opts = {})
        opts.delete(:open_timeout) || Thinkific::Config.open_timeout
      end

      def handle_response(response)
        raise Thinkific::RequestError, response unless response.success?

        response.parsed_response
      end

      def generate_url(_action_name, path, _params = {}, options = {})
        base_url = options[:base_url] || Thinkific::Config.base_url

        base_url + path
      end

      def log_request_and_response(uri, response, body = nil)
        Thinkific::Config.logger.info "Thinkific: #{uri}.\nBody: #{body}.\nResponse: #{response.code} #{response.body}"
      end
    end
  end
end
