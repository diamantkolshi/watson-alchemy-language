require 'spec_helper'

describe AlchemyLanguage::TitleExtraction do
  include AlchemyLanguage
  let(:self_class) { AlchemyLanguage::TitleExtraction }
  subject(:title_extraction) { self_class.new("path", "url") }

  before(:each) do
    allow(RestClient).to receive("get").and_return(json_response("title_extraction.json"))
  end

  it_should_behave_like "model_accessor"

  describe "#add_response_field" do
    it_should_behave_like "same_response_fields", "title_extraction"

    it "title_extraction class has method called title and return result from json_result" do
      is_expected.to respond_to(:title)
    end

    it "title method return hash from json_result['title']" do
      expect(title_extraction.title).to eq(title_extraction.json_result["title"])
    end
  end

  describe "initialize" do
    it "path instance variable" do
      expect(title_extraction.path).to eq("path")
    end

    it "auth_token instance variable" do
      expect(title_extraction.auth_token).to eq(AlchemyLanguage.secret_token)
    end
  end

  describe "#end_point" do
    let(:complete_path) { "url/URLGetTitle?apikey=da431323d51965268639e605b3c78169f710b86a&url=path&outputMode=json" }
    it "get end point with auth_token and path" do
      expect(title_extraction.end_point).to eq(complete_path)
    end
  end

  describe "#result" do
    it "return all result after request with title_extraction url" do
      expect(title_extraction.result).to eq(json_response("title_extraction.json", json_parse: true))
    end
  end
end
