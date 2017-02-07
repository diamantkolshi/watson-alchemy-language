require 'spec_helper'

describe AlchemyLanguage::DateExtraction do
  include AlchemyLanguage
  let(:self_class) { AlchemyLanguage::DateExtraction }
  subject(:date_extraction) { self_class.new("path", "url") }

  before(:each) do
    allow(RestClient).to receive("get").and_return(json_response("date_extraction.json"))
  end

  it_should_behave_like "model_accessor"

  describe "#add_response_field" do
    it "date_extraction class has method called status and return result from json_result" do
      is_expected.to respond_to(:status)
    end

    it "status method return hash from json_result['status']" do
      expect(date_extraction.status).to eq("OK")
    end

    it "date_extraction class has method called status and return result from json_result" do
      is_expected.to respond_to(:usage)
    end

    it "usage method return hash from json_result['usage']" do
      expect(date_extraction.usage).to eq(date_extraction.json_result["usage"])
    end

    it "date_extraction class has method called url and return result from json_result" do
      is_expected.to respond_to(:url)
    end

    it "url method return hash from json_result['url']" do
      expect(date_extraction.url).to eq(date_extraction.json_result["url"])
    end

    it "date_extraction class has method called totalTransactions and return result from json_result" do
      is_expected.to respond_to(:totalTransactions)
    end

    it "totalTransactions method return hash from json_result['totalTransactions']" do
      expect(date_extraction.totalTransactions).to eq(date_extraction.json_result["totalTransactions"])
    end

    it "date_extraction class has method called language and return result from json_result" do
      is_expected.to respond_to(:language)
    end

    it "language method return hash from json_result['totalTransactions']" do
      expect(date_extraction.language).to eq(date_extraction.json_result["language"])
    end

    it "date_extraction class has method called dates and return result from json_result" do
      is_expected.to respond_to(:dates)
    end

    it "dates method return hash from json_result['totalTransactions']" do
      expect(date_extraction.dates).to eq(date_extraction.json_result["dates"])
    end
  end

  describe "initialize" do
    it "path instance variable" do
      expect(date_extraction.path).to eq("path")
    end

    it "auth_token instance variable" do
      expect(date_extraction.auth_token).to eq(AlchemyLanguage.secret_token)
    end
  end

  describe "#end_point" do
    let(:complete_path) { "url/URLGetEmotion?apikey=da431323d51965268639e605b3c78169f710b86a&url=path&outputMode=json" }
    it "get end point with auth_token and path" do
      expect(date_extraction.end_point).to eq(complete_path)
    end
  end

  describe "#result" do
    it "return all result after request with date_extraction url" do
      expect(date_extraction.result).to eq(json_response("date_extraction.json", json_parse: true))
    end
  end
end
