require 'spec_helper'

describe AlchemyLanguage::TargetedEmotion do
  include AlchemyLanguage
  let(:self_class) { AlchemyLanguage::TargetedEmotion }
  subject(:targeted_emotion) { self_class.new("path", "url") }

  before(:each) do
    allow(RestClient).to receive("get").and_return(json_response("targeted_emotion.json"))
  end

  it_should_behave_like "model_accessor"

  describe "#add_response_field" do

    it_should_behave_like "same_response_fields", "targeted_emotion"

    it "targeted_emotion class has method called totalTransactions and return result from json_result" do
      is_expected.to respond_to(:totalTransactions)
    end

    it "totalTransactions method return hash from json_result['totalTransactions']" do
      expect(targeted_emotion.totalTransactions).to eq(targeted_emotion.json_result["totalTransactions"])
    end

    it "date_extraction class has method called language and return result from json_result" do
      is_expected.to respond_to(:language)
    end

    it "language method return hash from json_result['totalTransactions']" do
      expect(targeted_emotion.language).to eq(targeted_emotion.json_result["language"])
    end

    it "targeted_emotion class has method called results and return result from json_result" do
      is_expected.to respond_to(:results)
    end

    it "dates method return hash from json_result['results']" do
      expect(targeted_emotion.results).to eq(targeted_emotion.json_result["results"])
    end
  end

  it_should_behave_like "initialize_model", "targeted_emotion"

  it_should_behave_like "operation_methods", "targeted_emotion" ,"url/URLGetTargetedEmotion"

end
