require 'spec_helper'
require_relative '../../lib/alchemy_language/active_method/base'
require_relative '../../lib/alchemy_language/active_method/extra'
require_relative '../../lib/alchemy_language/url_service'
require_relative '../../lib/alchemy_language/generator/alchemy_request'
require_relative '../../lib/alchemy_language/model/author'

describe AlchemyLanguage::UrlService do
  let(:base) { AlchemyLanguage::ActiveMethod::Base }
  let(:extra) { AlchemyLanguage::ActiveMethod::Extra }
  let(:author) { AlchemyLanguage::Author }
  subject(:url_service) { AlchemyLanguage::UrlService.new("/path") }

  it "has accessor for path" do
    is_expected.to respond_to(:path)
  end

  it "has accessor for type" do
    is_expected.to respond_to(:type)
  end

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
    before(:each) do
      allow(base).to receive(:authenticate!).and_return("involve method authenticate")
    end

    it "involve authenticate and return something" do
      expect(base.before_request :authenticate!).to eq("involve method authenticate")
    end
  end

  describe "define model method inside class" do

    it "initially does not exist model method" do
      is_expected.not_to respond_to(:model_method)
    end

    it "create a new dinamic method with name model" do
      base.define_model :model_method

      expect(url_service).to respond_to(:model_method)
    end
  end
end
