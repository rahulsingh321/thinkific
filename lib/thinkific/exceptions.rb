module Thinkific
  class RequestError < StandardError
    attr_accessor :response

    def initialize(response, message=nil)
      message += "\n" if message
      me = super("#{message}Response body: #{response.body}",)
      me.response = response
      return me
    end
  end

  class ConfigurationError < StandardError; end
end
