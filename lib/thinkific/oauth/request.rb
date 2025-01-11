# frozen_string_literal: true

require "httparty"

module Thinkific
  module Oauth
    class Request < Connection
      include HTTParty

      class << self
        def refresh(token, subdomain, params = {}, options = {})
          oauth_post(token_url(subdomain), { grant_type: "refresh_token", refresh_token: token }.merge(params),
                     options)
        end

        def create(code, subdomain, params = {}, options = {})
          oauth_post(token_url(subdomain), { grant_type: "authorization_code", code: code }.merge(params),
                     options)
        end

        def authorize_url(params = {})
          client_id    = params[:client_id] || Thinkific::Config.client_id
          redirect_uri = params[:redirect_uri]
          state        = Base64.encode64(params[:state])

          # Replace subdomain with user input
          "https://subdomain.thinkific.com/oauth2/authorize?client_id=#{client_id}&response_type=code&redirect_uri=#{redirect_uri}&state=#{state}"
        end

        def token_url(subdomain)
          "https://#{subdomain}.thinkific.com/oauth2/token"
        end

        def oauth_post(url, params, options = {})
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

          raise Thinkific::RequestError, response unless response.success?

          no_parse ? response : response.parsed_response
        end
      end
    end
  end
end
