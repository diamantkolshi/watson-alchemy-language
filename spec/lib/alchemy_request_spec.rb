require 'spec_helper'

describe AlchemyLanguage::Generators::AlchemyRequest do
  include described_class

  describe "#base_url" do
    it "base url should be equal from alchemy language main module" do
      expect(base_url).to eq(AlchemyLanguage.base_url_request)
    end
  end

  describe "#rest_client_api" do
  end

  describe "#json_parser" do
  end
end
