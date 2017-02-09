require 'spec_helper'

describe AlchemyLanguage::SentimentAnalysis do
  include AlchemyLanguage
  let(:self_class) { AlchemyLanguage::SentimentAnalysis }
  subject(:sentiment_analysis) { self_class.new("path", "url") }

  before(:each) do
    allow(RestClient).to receive("get").and_return(json_response("sentiment_analysis.json"))
  end

  it_should_behave_like "model_accessor"

  describe "#add_response_field" do

    it_should_behave_like "same_response_fields", "sentiment_analysis"

    it "sentiment_analysis class has method called totalTransactions and return result from json_result" do
      is_expected.to respond_to(:totalTransactions)
    end

    it "totalTransactions method return hash from json_result['totalTransactions']" do
      expect(sentiment_analysis.totalTransactions).to eq(sentiment_analysis.json_result["totalTransactions"])
    end

    it "sentiment_analysis class has method called language and return result from json_result" do
      is_expected.to respond_to(:language)
    end

    it "language method return hash from json_result['totalTransactions']" do
      expect(sentiment_analysis.language).to eq(sentiment_analysis.json_result["language"])
    end

    it "sentiment_analysis class has method called docSentiment and return result from json_result" do
      is_expected.to respond_to(:docSentiment)
    end

    it "docSentiment method return hash from json_result['totalTransactions']" do
      expect(sentiment_analysis.docSentiment).to eq(sentiment_analysis.json_result["docSentiment"])
    end
  end

  describe "initialize" do
    it "path instance variable" do
      expect(sentiment_analysis.path).to eq("path")
    end

    it "auth_token instance variable" do
      expect(sentiment_analysis.auth_token).to eq(AlchemyLanguage.secret_token)
    end
  end

  describe "#end_point" do
    let(:complete_path) { "url/URLGetTextSentiment?apikey=da431323d51965268639e605b3c78169f710b86a&url=path&outputMode=json" }
    it "get end point with auth_token and path" do
      expect(sentiment_analysis.end_point).to eq(complete_path)
    end
  end

  describe "#result" do
    it "return all result after request with sentiment_analysis url" do
      expect(sentiment_analysis.result).to eq(json_response("sentiment_analysis.json", json_parse: true))
    end
  end
end
