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

  describe "initialize" do
    it "path instance variable" do
      expect(targeted_emotion.path).to eq("path")
    end

    it "auth_token instance variable" do
      expect(targeted_emotion.auth_token).to eq(AlchemyLanguage.secret_token)
    end
  end

  describe "#end_point" do
    let(:complete_path) { "url/URLGetTargetedEmotion?apikey=da431323d51965268639e605b3c78169f710b86a&url=path&outputMode=json" }
    it "get end point with auth_token and path" do
      expect(targeted_emotion.end_point).to eq(complete_path)
    end
  end

  describe "#result" do
    it "return all result after request with emotion_analysis url" do
      expect(targeted_emotion.result).to eq(json_response("targeted_emotion.json", json_parse: true))
    end
  end
end
