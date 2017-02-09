require 'spec_helper'

describe AlchemyLanguage::TargetedSentiment do
  include AlchemyLanguage
  let(:self_class) { AlchemyLanguage::TargetedSentiment }
  subject(:targeted_sentiment) { self_class.new("path", "url") }

  before(:each) do
    allow(RestClient).to receive("get").and_return(json_response("targeted_sentiment.json"))
  end

  it_should_behave_like "model_accessor"

  describe "#add_response_field" do

    it_should_behave_like "same_response_fields", "targeted_sentiment"

    it "targeted_sentiment class has method called totalTransactions and return result from json_result" do
      is_expected.to respond_to(:totalTransactions)
    end

    it "totalTransactions method return hash from json_result['totalTransactions']" do
      expect(targeted_sentiment.totalTransactions).to eq(targeted_sentiment.json_result["totalTransactions"])
    end

    it "targeted_sentiment class has method called language and return result from json_result" do
      is_expected.to respond_to(:language)
    end

    it "language method return hash from json_result['totalTransactions']" do
      expect(targeted_sentiment.language).to eq(targeted_sentiment.json_result["language"])
    end

    it "targeted_sentiment class has method called results and return result from json_result" do
      is_expected.to respond_to(:results)
    end

    it "results method return hash from json_result['totalTransactions']" do
      expect(targeted_sentiment.results).to eq(targeted_sentiment.json_result["results"])
    end
  end

  describe "initialize" do
    it "path instance variable" do
      expect(targeted_sentiment.path).to eq("path")
    end

    it "auth_token instance variable" do
      expect(targeted_sentiment.auth_token).to eq(AlchemyLanguage.secret_token)
    end
  end

  describe "#end_point" do
    let(:complete_path) { "url/URLGetTargetedSentiment?apikey=da431323d51965268639e605b3c78169f710b86a&url=path&outputMode=json" }
    it "get end point with auth_token and path" do
      expect(targeted_sentiment.end_point).to eq(complete_path)
    end
  end

  describe "#result" do
    it "return all result after request with targeted_sentiment url" do
      expect(targeted_sentiment.result).to eq(json_response("targeted_sentiment.json", json_parse: true))
    end
  end
end
