require 'spec_helper'

describe AlchemyLanguage::ActiveModel::Base do
  include AlchemyLanguage
  let(:inherited) { AlchemyLanguage::Author }
  subject(:instance_inherited) { inherited.new("path", "url", "a": "a-value", "b": "b-value") }

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

  describe "#params_addressable" do    
    it "hash value convert to addressable" do
      expect(instance_inherited.params_addressable).to eq("a=a-value&b=b-value")      
    end
  end

  describe "#check_prefix" do 
    it "when type is text this method convert to capitalize" do
      instance_inherited.instance_variable_set(:@type, "text")
      expect(instance_inherited.check_prefix).to eq("Text")
    end

    it "when type is url this method convert to uppercase" do
      expect(instance_inherited.check_prefix).to eq("URL")
    end

    it "when type is html this method convert to uppcase" do 
      instance_inherited.instance_variable_set(:@type, "html")
      expect(instance_inherited.check_prefix).to eq("HTML")
    end
  end
end
