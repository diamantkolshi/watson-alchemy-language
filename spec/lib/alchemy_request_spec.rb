require 'spec_helper'
require_relative '../../lib/alchemy_language/generator/alchemy_request'

describe AlchemyLanguage::Generators::AlchemyRequest do
  subject(:request_api_intance) { AlchemyLanguage::Generators::AlchemyRequest }

  describe "#base_url" do
    # it "base url should be equal from alchemy language main module" do
    #   expect(request_api_intance.base_url).to eq(AlchemyLanguage.base_url_request)
    # end
  end
end
