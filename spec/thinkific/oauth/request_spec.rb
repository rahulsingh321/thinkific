# frozen_string_literal: true

require "spec_helper"

RSpec.describe Thinkific::Oauth::Request do
  before do
    Thinkific::Config.configure(client_id: "client-id", client_secret: "client-secret")
    allow(described_class).to receive(:log_request_and_response)
  end

  describe ".authorize_url" do
    it "uses the configured client id and base64-encodes state without line breaks" do
      url = described_class.authorize_url(
        redirect_uri: "https://app.example.test/callback",
        state: "opaque-state"
      )

      expect(url).to eq(
        "https://subdomain.thinkific.com/oauth2/authorize" \
        "?client_id=client-id&response_type=code" \
        "&redirect_uri=https://app.example.test/callback" \
        "&state=#{Base64.strict_encode64('opaque-state')}"
      )
      expect(url).not_to include("\n")
    end
  end

  describe ".token_url" do
    it "builds the token endpoint from the subdomain" do
      expect(described_class.token_url("academy")).to eq("https://academy.thinkific.com/oauth2/token")
    end
  end

  describe ".refresh" do
    it "delegates to oauth_post with refresh_token parameters" do
      allow(described_class).to receive(:oauth_post)

      described_class.refresh("refresh-token", "academy", { scope: "read" }, no_parse: true)

      expect(described_class).to have_received(:oauth_post).with(
        "https://academy.thinkific.com/oauth2/token",
        { grant_type: "refresh_token", refresh_token: "refresh-token", scope: "read" },
        no_parse: true
      )
    end
  end

  describe ".create" do
    it "delegates to oauth_post with authorization_code parameters" do
      allow(described_class).to receive(:oauth_post)

      described_class.create("auth-code", "academy", { redirect_uri: "https://app.example.test/callback" })

      expect(described_class).to have_received(:oauth_post).with(
        "https://academy.thinkific.com/oauth2/token",
        {
          grant_type: "authorization_code",
          code: "auth-code",
          redirect_uri: "https://app.example.test/callback"
        },
        {}
      )
    end
  end

  describe ".oauth_post" do
    it "posts with basic auth and returns the parsed response by default" do
      response = instance_double(
        HTTParty::Response,
        success?: true,
        parsed_response: { "access_token" => "abc123" },
        code: 200,
        body: '{"access_token":"abc123"}'
      )

      allow(described_class).to receive(:post).and_return(response)

      result = described_class.oauth_post(
        "https://academy.thinkific.com/oauth2/token",
        grant_type: "refresh_token"
      )

      expect(described_class).to have_received(:post).with(
        "https://academy.thinkific.com/oauth2/token",
        body: { grant_type: "refresh_token" },
        basic_auth: { username: "client-id", password: "client-secret" }
      )
      expect(result).to eq("access_token" => "abc123")
    end

    it "returns the raw response when no_parse is requested" do
      response = instance_double(
        HTTParty::Response,
        success?: true,
        parsed_response: { "access_token" => "abc123" },
        code: 200,
        body: '{"access_token":"abc123"}'
      )

      allow(described_class).to receive(:post).and_return(response)

      expect(
        described_class.oauth_post(
          "https://academy.thinkific.com/oauth2/token",
          { grant_type: "refresh_token" },
          no_parse: true
        )
      ).to eq(response)
    end

    it "raises a request error when the response is unsuccessful" do
      response = instance_double(
        HTTParty::Response,
        success?: false,
        code: 401,
        body: '{"error":"invalid_client"}'
      )

      allow(described_class).to receive(:post).and_return(response)

      expect do
        described_class.oauth_post(
          "https://academy.thinkific.com/oauth2/token",
          grant_type: "refresh_token"
        )
      end.to raise_error(Thinkific::RequestError, /invalid_client/)
    end
  end
end
