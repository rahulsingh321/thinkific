# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Thinkific admin resources" do
  before do
    allow(Thinkific::Connection).to receive(:make_api_call).and_return({})
  end

  it "builds paginated user listing paths" do
    Thinkific::Admin::Users.list(
      nil,
      query: { email: "person@example.com" },
      per_page: 10,
      page_number: 2
    )

    expect(Thinkific::Connection).to have_received(:make_api_call).with(
      :get,
      "/users?page=2&limit=10&query%5Bemail%5D=person@example.com",
      hash_including(query: { email: "person@example.com" }, per_page: 10, page_number: 2)
    )
  end

  it "adds the products collection path for categories" do
    params = { page_number: 3 }

    Thinkific::Admin::Categories.list_products(12, params)

    expect(Thinkific::Connection).to have_received(:make_api_call).with(
      :get,
      "/collections/12/products?page=3&limit=25",
      hash_including(page_number: 3, custom_path: "/products")
    )
  end

  it "adds the courses collection path for bundles" do
    params = { per_page: 50 }

    Thinkific::Admin::Bundles.list_courses(12, params)

    expect(Thinkific::Connection).to have_received(:make_api_call).with(
      :get,
      "/bundles/12/courses?page=1&limit=50",
      hash_including(per_page: 50, custom_path: "/courses")
    )
  end

  it "builds authentication paths with the provider segment" do
    Thinkific::Admin::Users.authentications(7, "google-oauth2", locale: "en")

    expect(Thinkific::Connection).to have_received(:make_api_call).with(
      :get,
      "/users/7/authentications/google-oauth2",
      locale: "en"
    )
  end

  it "posts approve and deny actions for product publish requests" do
    Thinkific::Admin::ProductPublishRequests.approve(9, reviewer: "ops")
    Thinkific::Admin::ProductPublishRequests.deny(9, reviewer: "ops")

    expect(Thinkific::Connection).to have_received(:make_api_call).with(
      :post,
      "/product_publish_requests/9/approve",
      reviewer: "ops"
    )
    expect(Thinkific::Connection).to have_received(:make_api_call).with(
      :post,
      "/product_publish_requests/9/deny",
      reviewer: "ops"
    )
  end
end
