# frozen_string_literal: true

require "spec_helper"

RSpec.describe Thinkific::Connection do
  before do
    Thinkific::Config.configure(base_url: "https://api.example.test", timeout: 30)
    allow(described_class).to receive(:log_request_and_response)
  end

  describe ".make_api_call" do
    it "builds an escaped URL and returns the parsed response" do
      response = instance_double(
        HTTParty::Response,
        success?: true,
        parsed_response: { "ok" => true },
        code: 200,
        body: '{"ok":true}'
      )

      allow(described_class).to receive(:get).and_return(response)

      result = described_class.make_api_call(
        :get,
        "/users/:id",
        id: "alpha beta",
        status: "active",
        tags: ["course a", "a&b"]
      )

      expect(described_class).to have_received(:get).with(
        "https://api.example.test/users/alpha+beta?status=active&tags=course+a&tags=a%26b",
        format: :json,
        read_timeout: 30,
        open_timeout: 30
      )
      expect(result).to eq("ok" => true)
    end

    it "extracts timeout overrides without leaking them into the query string" do
      response = instance_double(
        HTTParty::Response,
        success?: true,
        parsed_response: { "ok" => true },
        code: 200,
        body: '{"ok":true}'
      )
      params = { id: 42, read_timeout: 5, open_timeout: 7 }

      allow(described_class).to receive(:get).and_return(response)

      described_class.make_api_call(:get, "/users/:id", params)

      expect(described_class).to have_received(:get).with(
        "https://api.example.test/users/42",
        format: :json,
        read_timeout: 5,
        open_timeout: 7
      )
      expect(params).to eq(id: 42, read_timeout: 5, open_timeout: 7)
    end

    it "raises a request error when the response is unsuccessful" do
      response = instance_double(
        HTTParty::Response,
        success?: false,
        code: 422,
        body: '{"error":"invalid"}'
      )

      allow(described_class).to receive(:get).and_return(response)

      expect { described_class.make_api_call(:get, "/users") }
        .to raise_error(Thinkific::RequestError, /Response body: \{"error":"invalid"\}/)
    end
  end
end
