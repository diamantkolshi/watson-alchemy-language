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

  it_should_behave_like "initialize_model", "sentiment_analysis"

  it_should_behave_like "operation_methods", "sentiment_analysis" ,"url/URLGetTextSentiment"

end
