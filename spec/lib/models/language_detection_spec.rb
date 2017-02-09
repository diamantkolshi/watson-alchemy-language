require 'spec_helper'

describe AlchemyLanguage::LanguageDetection do
  include AlchemyLanguage
  let(:self_class) { AlchemyLanguage::LanguageDetection }
  subject(:language_detection) { self_class.new("path", "url") }

  before(:each) do
    allow(RestClient).to receive("get").and_return(json_response("language_detection.json"))
  end

  it_should_behave_like "model_accessor"

  describe "#add_response_field" do

    it_should_behave_like "same_response_fields", "language_detection"

    it "language_detection class has method called language and return result from json_result" do
      is_expected.to respond_to(:language)
    end

    it "language method return hash from json_result['language']" do
      expect(language_detection.language).to eq(language_detection.json_result["language"])
    end

    it "language_detection class has method called iso-639-1 and return result from json_result" do
      is_expected.to respond_to(:iso_639_1)
    end

    it "iso_639_1 method return hash from json_result['iso_639_1']" do
      expect(language_detection.iso_639_1).to eq(language_detection.json_result["iso-639-1"])
    end

    it "language_detection class has method called iso_639_2 and return result from json_result" do
      is_expected.to respond_to(:iso_639_2)
    end

    it "iso_639_2 method return hash from json_result['iso_639_2']" do
      expect(language_detection.iso_639_2).to eq(language_detection.json_result["iso-639-2"])
    end

    it "language_detection class has method called iso_639_3 and return result from json_result" do
      is_expected.to respond_to(:iso_639_3)
    end

    it "iso_639_3 method return hash from json_result['iso_639_3']" do
      expect(language_detection.iso_639_3).to eq(language_detection.json_result["iso-639-3"])
    end

    it "language_detection class has method called ethnologue and return result from json_result" do
      is_expected.to respond_to(:ethnologue)
    end

    it "ethnologue method return hash from json_result['ethnologue']" do
      expect(language_detection.ethnologue).to eq(language_detection.json_result["ethnologue"])
    end

    it "language_detection class has method called native-speakers and return result from json_result" do
      is_expected.to respond_to(:native_speakers)
    end

    it "native_speakers method return hash from json_result['native_speakers']" do
      expect(language_detection.native_speakers).to eq(language_detection.json_result["native-speakers"])
    end

    it "language_detection class has method called wikipedia and return result from json_result" do
      is_expected.to respond_to(:wikipedia)
    end

    it "wikipedia method return hash from json_result['language_detections']" do
      expect(language_detection.wikipedia).to eq(language_detection.json_result["wikipedia"])
    end
  end

  describe "initialize" do
    it "path instance variable" do
      expect(language_detection.path).to eq("path")
    end

    it "auth_token instance variable" do
      expect(language_detection.auth_token).to eq(AlchemyLanguage.secret_token)
    end
  end

  describe "#end_point" do
    let(:complete_path) { "url/URLGetLanguage?apikey=da431323d51965268639e605b3c78169f710b86a&url=path&outputMode=json" }
    it "get end point with auth_token and path" do
      expect(language_detection.end_point).to eq(complete_path)
    end
  end

  describe "#result" do
    it "return all result after request with language_detection url" do
      expect(language_detection.result).to eq(json_response("language_detection.json", json_parse: true))
    end
  end
end
