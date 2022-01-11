module Thinkific
  class Connection
    include HTTParty

    class << self

      def get_json(path, opts)
        url = generate_url(path, opts)
        response = get(url, format: :json, read_timeout: read_timeout(opts), open_timeout: open_timeout(opts))
        log_request_and_response url, response

        raise(Thinkific::RequestError.new(response)) unless response.success?
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
        if response.success?
          response.parsed_response
        else
          raise(Thinkific::RequestError.new(response))
        end
      end

      def generate_url(path, params={}, options={})
        path = path.clone
        params = params.clone
        base_url = options[:base_url] || Thinkific::Config.base_url

        params.each do |k,v|
          if path.match(":#{k}")
            path.gsub!(":#{k}", CGI.escape(v.to_s))
            params.delete(k)
          end
        end

        query = params.map do |k,v|
          v.is_a?(Array) ? v.map { |value| param_string(k,value) } : param_string(k,v)
        end.join("&")

        path += path.include?('?') ? '&' : "?" if query.present?
        base_url + path + query
      end

      def log_request_and_response(uri, response, body=nil)
        Thinkific::Config.logger.info "Thinkific: #{uri}.\nBody: #{body}.\nResponse: #{response.code} #{response.body}"
      end
    end
  end
end
