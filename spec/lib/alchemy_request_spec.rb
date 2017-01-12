require 'spec_helper'
require_relative '../../lib/alchemy_language/generator/alchemy_request'

describe AlchemyLanguage::Generators::AlchemyRequest do
  let(:request_api_intance) { AlchemyLanguage::Generators::AlchemyRequest.new("/path") }

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
