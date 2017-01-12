require 'spec_helper'
require_relative '../../lib/alchemy_language/active_method/base'
require_relative '../../lib/alchemy_language/url_service'

describe AlchemyLanguage::UrlService do

  before(:each) do
    @double = double("Post")
  end

  describe "when path is valid" do
    let(:url_service)  { AlchemyLanguage::UrlService.new("http://www.google.com") }

    it "path equal" do
      expect(url_service.path).to eq("http://www.google.com")
    end

    it "is_url? return nothing else" do
      expect(url_service.is_url?).to eq(nil)
    end

    it "check url return true" do
      expect(url_service.check_url).to be_truthy
    end
  end

  describe "when path is invalid" do
    let(:url_service_failure)  { AlchemyLanguage::UrlService.new("www.google.com") }

    it "path equal" do
      expect(url_service_failure.path).to eq("www.google.com")
    end

    it "is_url? return nothing else" do
      expect(url_service_failure.is_url?).to eq("params is not url")
    end

    it "check url return true" do
      expect(url_service_failure.check_url).to be_falsey
    end
  end

  describe "involve method before request" do
    it "involve authenticate" do
      
    end
  end
end
