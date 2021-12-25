require 'httparty'

module Thinkific
  class Oauth < Connection
    include HTTParty

    class << self
      def refresh(token, params={}, options={})
        oauth_post(token_url, { grant_type: 'refresh_token', refresh_token: token }.merge(params),
          options)
      end

      def create(code, params={}, options={})
        oauth_post(token_url, { grant_type: 'authorization_code', code: code }.merge(params),
          options)
      end

      def authorize_url(params={})
        client_id = params[:client_id] || Thinkific::Config.client_id
        redirect_uri = params[:redirect_uri] || Thinkific::Config.redirect_uri
        subdomain = params[:subdomain] || 'walletcard-test'

        "https://#{subdomain}.thinkific.com/oauth2/authorize?client_id=#{client_id}&response_type=code&redirect_uri=#{redirect_uri}&state=sdsdvvag"
      end

      def token_url
        token_url = "https://#{subdomain}.thinkific.com/oauth2/token"
      end

      def oauth_post(url, params, options={})
        no_parse = options[:no_parse] || false

        body = {
          client_id: Thinkific::Config.client_id,
          client_secret: Thinkific::Config.client_secret,
          redirect_uri: Thinkific::Config.redirect_uri,
        }.merge(params)

        response = post(url, body: body, headers: DEFAULT_OAUTH_HEADERS)
        log_request_and_response url, response, body

        raise(Thinkific::RequestError.new(response)) unless response.success?

        no_parse ? response : response.parsed_response
      end
    end
  end
end
