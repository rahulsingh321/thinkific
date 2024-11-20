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

      def generate_url(path, params = {}, options = {})
        path = path.clone
        params = params.clone
        base_url = options[:base_url] || Thinkific::Config.base_url

        params.each do |k, v|
          if path.match(":#{k}")
            path.gsub!(":#{k}", CGI.escape(v.to_s))
            params.delete(k)
          end
        end

        query = params.map do |k,v|
          v.is_a?(Array) ? v.map { |value| param_string(k,value) } : param_string(k,v)
        end.join("&")

        path += path.include?('?') ? '&' : '?' if query.present?
        base_url + path + (query.present? ? query : "")
      end

      def param_string(key, value)
        "#{key}=#{converted_value(value)}"
      end


      def converted_value(value)
        CGI.escape(value.to_s)
      end

      def log_request_and_response(uri, response, body = nil)
        Thinkific::Config.logger.info "Thinkific: #{uri}.\nBody: #{body}.\nResponse: #{response.code} #{response.body}"
      end
    end
  end
end
