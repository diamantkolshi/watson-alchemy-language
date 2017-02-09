require 'spec_helper'

describe AlchemyLanguage::Entity do
  include AlchemyLanguage
  let(:self_class) { AlchemyLanguage::Entity }
  subject(:entity) { self_class.new("path", "url") }

  before(:each) do
    allow(RestClient).to receive("get").and_return(json_response("entity.json"))
  end

  it_should_behave_like "model_accessor"

  describe "#add_response_field" do

    it_should_behave_like "same_response_fields", "entity"

    it "entity class has method called language and return result from json_result" do
      is_expected.to respond_to(:language)
    end

    it "authors method return hash from json_result['authors']" do
      expect(entity.language).to eq(entity.json_result["language"])
    end
  end

  describe "initialize" do
    it "path instance variable" do
      expect(entity.path).to eq("path")
    end

    it "auth_token instance variable" do
      expect(entity.auth_token).to eq(AlchemyLanguage.secret_token)
    end
  end

  describe "#end_point" do
    let(:complete_path) { "url/URLGetRankedNamedEntities?apikey=#{entity.auth_token}&url=#{entity.path}&outputMode=json" }
    it "get end point with auth_token and path" do
      expect(entity.end_point).to eq(complete_path)
    end
  end

  describe "#result" do
    it "return all result after request with entity url" do
      expect(entity.result).to eq(json_response("entity.json", json_parse: true))
    end
  end
end
