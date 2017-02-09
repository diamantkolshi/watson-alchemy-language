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

  it_should_behave_like "initialize_model", "targeted_sentiment"

  it_should_behave_like "operation_methods", "targeted_sentiment" ,"url/URLGetTargetedSentiment"

end
