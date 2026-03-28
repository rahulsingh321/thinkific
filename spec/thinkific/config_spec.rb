# frozen_string_literal: true

require "spec_helper"

RSpec.describe Thinkific::Config do
  describe ".configure" do
    it "applies custom values and timeout defaults from symbol keys" do
      logger = Logger.new(nil)

      described_class.configure(
        logger: logger,
        base_url: "https://api.example.test",
        client_id: "client-id",
        client_secret: "client-secret",
        timeout: 15
      )

      expect(described_class.logger).to eq(logger)
      expect(described_class.base_url).to eq("https://api.example.test")
      expect(described_class.client_id).to eq("client-id")
      expect(described_class.client_secret).to eq("client-secret")
      expect(described_class.read_timeout).to eq(15)
      expect(described_class.open_timeout).to eq(15)
    end

    it "accepts string keys and falls back to default values" do
      described_class.configure("client_id" => "client-id")

      expect(described_class.logger).to eq(described_class::DEFAULT_LOGGER)
      expect(described_class.base_url).to eq("https://api.thinkific.com/api/public/v1")
      expect(described_class.client_id).to eq("client-id")
      expect(described_class.client_secret).to be_nil
    end
  end

  describe ".ensure!" do
    it "raises when a requested setting is missing" do
      described_class.configure(client_id: "client-id")

      expect { described_class.ensure!(:client_id, :client_secret) }
        .to raise_error(Thinkific::ConfigurationError, "'client_secret' not configured")
    end

    it "does not raise when the requested settings are present" do
      described_class.configure(client_id: "client-id", client_secret: "client-secret")

      expect { described_class.ensure!(:client_id, :client_secret) }.not_to raise_error
    end
  end

  describe ".reset!" do
    it "restores defaults and clears credentials and timeouts" do
      described_class.configure(
        base_url: "https://api.example.test",
        client_id: "client-id",
        client_secret: "client-secret",
        timeout: 15
      )

      described_class.reset!

      expect(described_class.logger).to eq(described_class::DEFAULT_LOGGER)
      expect(described_class.base_url).to eq("https://api.thinkific.com/api/public/v1")
      expect(described_class.client_id).to be_nil
      expect(described_class.client_secret).to be_nil
      expect(described_class.read_timeout).to be_nil
      expect(described_class.open_timeout).to be_nil
    end
  end
end
