require 'spec_helper'

describe AlchemyLanguage::Text do
  include AlchemyLanguage
  let(:self_class) { AlchemyLanguage::Text }
  subject(:text) { self_class.new("path", "url") }

  before(:each) do
    allow(RestClient).to receive("get").and_return(json_response("text.json"))
  end

  it_should_behave_like "model_accessor"

  describe "#add_response_field" do

    it_should_behave_like "same_response_fields", "text"

    it "text class has method called language and return result from json_result" do
      is_expected.to respond_to(:language)
    end

    it "language method return hash from json_result['totalTransactions']" do
      expect(text.language).to eq(text.json_result["language"])
    end

    it "text class has method called text and return result from json_result" do
      is_expected.to respond_to(:text)
    end

    it "text method return hash from json_result['totalTransactions']" do
      expect(text.text).to eq(text.json_result["text"])
    end
  end

  describe "initialize" do
    it "path instance variable" do
      expect(text.path).to eq("path")
    end

    it "auth_token instance variable" do
      expect(text.auth_token).to eq(AlchemyLanguage.secret_token)
    end
  end

  describe "#end_point" do
    let(:complete_path) { "url/URLGetText?apikey=da431323d51965268639e605b3c78169f710b86a&url=path&outputMode=json" }
    it "get end point with auth_token and path" do
      expect(text.end_point).to eq(complete_path)
    end
  end

  describe "#result" do
    it "return all result after request with text url" do
      expect(text.result).to eq(json_response("text.json", json_parse: true))
    end
  end
end
