require 'spec_helper'

describe AlchemyLanguage::Keyword do
  include AlchemyLanguage
  let(:self_class) { AlchemyLanguage::Keyword }
  subject(:keyword) { self_class.new("path", "url") }

  before(:each) do
    allow(RestClient).to receive("get").and_return(json_response("keyword.json"))
  end

  it_should_behave_like "model_accessor"

  describe "#add_response_field" do

    it_should_behave_like "same_response_fields", "keyword"

    it "keyword class has method called totalTransactions and return result from json_result" do
      is_expected.to respond_to(:totalTransactions)
    end

    it "totalTransactions method return hash from json_result['totalTransactions']" do
      expect(keyword.totalTransactions).to eq(keyword.json_result["totalTransactions"])
    end

    it "keyword class has method called language and return result from json_result" do
      is_expected.to respond_to(:language)
    end

    it "language method return hash from json_result['totalTransactions']" do
      expect(keyword.language).to eq(keyword.json_result["language"])
    end

    it "keyword class has method called keywords and return result from json_result" do
      is_expected.to respond_to(:keywords)
    end

    it "keywords method return hash from json_result['keywords']" do
      expect(keyword.keywords).to eq(keyword.json_result["keywords"])
    end
  end

  describe "initialize" do
    it "path instance variable" do
      expect(keyword.path).to eq("path")
    end

    it "auth_token instance variable" do
      expect(keyword.auth_token).to eq(AlchemyLanguage.secret_token)
    end
  end

  describe "#end_point" do
    let(:complete_path) { "url/URLGetRankedKeywords?apikey=da431323d51965268639e605b3c78169f710b86a&url=path&outputMode=json" }
    it "get end point with auth_token and path" do
      expect(keyword.end_point).to eq(complete_path)
    end
  end

  describe "#result" do
    it "return all result after request with keyword url" do
      expect(keyword.result).to eq(json_response("keyword.json", json_parse: true))
    end
  end
end
