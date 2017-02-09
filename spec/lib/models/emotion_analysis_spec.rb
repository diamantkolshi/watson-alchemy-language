require 'spec_helper'

describe AlchemyLanguage::EmotionAnalysis do
  include AlchemyLanguage
  let(:self_class) { AlchemyLanguage::EmotionAnalysis }
  subject(:emotion_analysis) { self_class.new("path", "url") }

  before(:each) do
    allow(RestClient).to receive("get").and_return(json_response("emotion_analysis.json"))
  end

  it_should_behave_like "model_accessor"

  describe "#add_response_field" do

    it_should_behave_like "same_response_fields", "emotion_analysis"

    it "emotion_analysis class has method called totalTransactions and return result from json_result" do
      is_expected.to respond_to(:totalTransactions)
    end

    it "totalTransactions method return hash from json_result['totalTransactions']" do
      expect(emotion_analysis.totalTransactions).to eq(emotion_analysis.json_result["totalTransactions"])
    end

    it "date_extraction class has method called language and return result from json_result" do
      is_expected.to respond_to(:language)
    end

    it "language method return hash from json_result['totalTransactions']" do
      expect(emotion_analysis.language).to eq(emotion_analysis.json_result["language"])
    end

    it "emotion_analysis class has method called docEmotions and return result from json_result" do
      is_expected.to respond_to(:docEmotions)
    end

    it "dates method return hash from json_result['docEmotions']" do
      expect(emotion_analysis.docEmotions).to eq(emotion_analysis.json_result["docEmotions"])
    end
  end

  it_should_behave_like "initialize_model", "emotion_analysis"

  it_should_behave_like "operation_methods", "emotion_analysis" ,"url/URLGetEmotion"

end
