require 'spec_helper'

describe AlchemyLanguage::ActiveModel::Base do
  include AlchemyLanguage
  let(:inherited) { AlchemyLanguage::Author }
  subject(:instance_inherited) { inherited.new("path", "url") }

  before(:each) do
    allow(RestClient).to receive("get").and_return(json_response("author.json"))
  end

  describe "#add_response_field" do
    it "instance_inherited class has method called status and return result from json_result" do
      is_expected.to respond_to(:status)
    end

    it "status method return hash from json_result['status']" do
      expect(instance_inherited.status).to eq("OK")
    end

    it "instance_inherited class has method called status and return result from json_result" do
      is_expected.to respond_to(:usage)
    end

    it "usage method return hash from json_result['usage']" do
      expect(instance_inherited.usage).to eq(instance_inherited.json_result["usage"])
    end

    it "instance_inherited class has method called url and return result from json_result" do
      is_expected.to respond_to(:url)
    end

    it "url method return hash from json_result['url']" do
      expect(instance_inherited.url).to eq(instance_inherited.json_result["url"])
    end
  end
end
