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
    it "emotion_analysis class has method called status and return result from json_result" do
      is_expected.to respond_to(:status)
    end

    it "status method return hash from json_result['status']" do
      expect(emotion_analysis.status).to eq("OK")
    end

    it "emotion_analysis class has method called status and return result from json_result" do
      is_expected.to respond_to(:usage)
    end

    it "usage method return hash from json_result['usage']" do
      expect(emotion_analysis.usage).to eq(emotion_analysis.json_result["usage"])
    end

    it "emotion_analysis class has method called url and return result from json_result" do
      is_expected.to respond_to(:url)
    end

    it "url method return hash from json_result['url']" do
      expect(emotion_analysis.url).to eq(emotion_analysis.json_result["url"])
    end

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

  describe "initialize" do
    it "path instance variable" do
      expect(emotion_analysis.path).to eq("path")
    end

    it "auth_token instance variable" do
      expect(emotion_analysis.auth_token).to eq(AlchemyLanguage.secret_token)
    end
  end

  describe "#end_point" do
    let(:complete_path) { "url/URLGetEmotion?apikey=da431323d51965268639e605b3c78169f710b86a&url=path&outputMode=json" }
    it "get end point with auth_token and path" do
      expect(emotion_analysis.end_point).to eq(complete_path)
    end
  end

  describe "#result" do
    it "return all result after request with emotion_analysis url" do
      expect(emotion_analysis.result).to eq(json_response("emotion_analysis.json", json_parse: true))
    end
  end
end
