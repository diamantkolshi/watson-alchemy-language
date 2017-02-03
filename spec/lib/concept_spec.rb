require 'spec_helper'
require_relative '../../lib/alchemy_language/generator/alchemy_request'
require_relative '../../lib/alchemy_language/active_method/extra'
require_relative '../../lib/alchemy_language/model/concept'

describe AlchemyLanguage::Concept do
  include AlchemyLanguage
  let(:self_class) { AlchemyLanguage::Concept }
  subject(:concept) { self_class.new("path", "url") }

  before(:each) do
    allow(RestClient).to receive("get").and_return(json_response("concept.json"))
  end

  it_should_behave_like "model_accessor"

  describe "#add_response_field" do
    it "concept class has method called status and return result from json_result" do
      is_expected.to respond_to(:status)
    end

    it "status method return hash from json_result['status']" do
      expect(concept.status).to eq("OK")
    end

    it "concept class has method called status and return result from json_result" do
      is_expected.to respond_to(:usage)
    end

    it "usage method return hash from json_result['usage']" do
      expect(concept.usage).to eq(concept.json_result["usage"])
    end

    it "concept class has method called url and return result from json_result" do
      is_expected.to respond_to(:url)
    end

    it "url method return hash from json_result['url']" do
      expect(concept.url).to eq(concept.json_result["url"])
    end

    it "concept class has method called concepts and return result from json_result" do
      is_expected.to respond_to(:concepts)
    end

    it "concepts method return hash from json_result['concepts']" do
      expect(concept.concepts).to eq(concept.json_result["concepts"])
    end
  end

  describe "initialize" do
    it "path instance variable" do
      expect(concept.path).to eq("path")
    end

    it "auth_token instance variable" do
      expect(concept.auth_token).to eq(AlchemyLanguage.secret_token)
    end
  end

  describe "#end_point" do
    let(:complete_path) { "url/URLGetRankedConcepts?apikey=da431323d51965268639e605b3c78169f710b86a&url=path&outputMode=json" }
    it "get end point with auth_token and path" do
      expect(concept.end_point).to eq(complete_path)
    end
  end

  describe "#result" do
    it "return all result after request with concept url" do
      expect(concept.result).to eq(json_response("concept.json", json_parse: true))
    end
  end
end
