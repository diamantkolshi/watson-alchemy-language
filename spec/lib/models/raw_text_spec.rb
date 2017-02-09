require 'spec_helper'

describe AlchemyLanguage::RawText do
  include AlchemyLanguage
  let(:self_class) { AlchemyLanguage::RawText }
  subject(:raw_text) { self_class.new("path", "url") }

  before(:each) do
    allow(RestClient).to receive("get").and_return(json_response("raw_text.json"))
  end

  it_should_behave_like "model_accessor"

  describe "#add_response_field" do

    it_should_behave_like "same_response_fields", "raw_text"

    it "raw_text class has method called text and return result from json_result" do
      is_expected.to respond_to(:text)
    end

    it "text method return hash from json_result['text']" do
      expect(raw_text.text).to eq(raw_text.json_result["text"])
    end
  end

  describe "initialize" do
    it "path instance variable" do
      expect(raw_text.path).to eq("path")
    end

    it "auth_token instance variable" do
      expect(raw_text.auth_token).to eq(AlchemyLanguage.secret_token)
    end
  end

  describe "#end_point" do
    let(:complete_path) { "url/URLGetRawText?apikey=da431323d51965268639e605b3c78169f710b86a&url=path&outputMode=json" }
    it "get end point with auth_token and path" do
      expect(raw_text.end_point).to eq(complete_path)
    end
  end

  describe "#result" do
    it "return all result after request with raw_text url" do
      expect(raw_text.result).to eq(json_response("raw_text.json", json_parse: true))
    end
  end
end
