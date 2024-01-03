# frozen_string_literal: true

module Thinkific
  class Connection
    include HTTParty

    class << self
      def make_api_call(action_name, path, params={})
        url      = generate_url(path, params)
        response = public_send(action_name, url, format: :json, read_timeout: read_timeout(params), open_timeout: open_timeout(params))
        log_request_and_response url, response

        raise Thinkific::RequestError, response unless response.success?

        response.parsed_response
      end

      protected

      def read_timeout(params = {})
        params.delete(:read_timeout) || Thinkific::Config.read_timeout
      end

      def open_timeout(params = {})
        params.delete(:open_timeout) || Thinkific::Config.open_timeout
      end

      def handle_response(response)
        raise Thinkific::RequestError, response unless response.success?

        response.parsed_response
      end

      def generate_url(path, options)
        base_url = options[:base_url] || Thinkific::Config.base_url
        base_url + path
      end

      def log_request_and_response(uri, response, body = nil)
        Thinkific::Config.logger.info "Thinkific: #{uri}.\nBody: #{body}.\nResponse: #{response.code} #{response.body}"
      end
    end
  end
end
