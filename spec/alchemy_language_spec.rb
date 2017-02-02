require 'spec_helper'

describe AlchemyLanguage do
  subject(:main_module) { described_class }

  describe ".base_url_request" do
    it "retrun static domain url" do
      expect(main_module.base_url_request).to eq("https://gateway-a.watsonplatform.net/calls")
    end
  end
end
