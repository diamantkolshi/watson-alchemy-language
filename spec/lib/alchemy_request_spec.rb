require 'spec_helper'
require_relative '../../lib/alchemy_language/generator/alchemy_request'

describe AlchemyLanguage::Generators::AlchemyRequest do
  subject(:request_api_intance) { AlchemyLanguage::Generators::AlchemyRequest.new("/path") }

  it "has accessor for url" do
    is_expected.to respond_to(:url)
  end

  it "has accessor for request_path" do
    is_expected.to respond_to(:request_path)
  end

  describe "initialize" do
    it "have url attribute" do
      expect(request_api_intance.url).to eq("/path")
    end
  end

  describe "#base_url" do
    it "base url should be equal from alchemy language main module" do
      expect(request_api_intance.base_url).to eq(AlchemyLanguage.base_url_request)
    end
  end
end
