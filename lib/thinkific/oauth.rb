require 'httparty'

module Thinkific
  class Oauth < Connection
    include HTTParty

    class << self
      def refresh(token, subdomain, params={}, options={})
        oauth_post(token_url(subdomain), { grant_type: 'refresh_token', refresh_token: token }.merge(params),
          options)
      end

      def create(code, subdomain, params={}, options={})
        oauth_post(token_url(subdomain), { grant_type: 'authorization_code', code: code }.merge(params),
          options)
      end

      def authorize_url(params={})
        client_id = params[:client_id] || Thinkific::Config.client_id
        redirect_uri = params[:redirect_uri]
        subdomain = params[:subdomain] || 'walletcard-test'
        state = Base64.encode64(params[:state])

        "https://#{subdomain}.thinkific.com/oauth2/authorize?client_id=#{client_id}&response_type=code&redirect_uri=#{redirect_uri}&state=#{state}"
      end

      def token_url(subdomain)
        token_url = "https://#{subdomain}.thinkific.com/oauth2/token"
      end

      def oauth_post(url, params, options={})
        no_parse = options[:no_parse] || false

        auth = {
          username: Thinkific::Config.client_id,
          password: Thinkific::Config.client_secret
        }

        opts = {
          body: params,
          basic_auth: auth
        }

        response = post(url, opts)
        log_request_and_response url, response, params

        raise(Thinkific::RequestError.new(response)) unless response.success?

        no_parse ? response : response.parsed_response
      end
    end
  end
end
