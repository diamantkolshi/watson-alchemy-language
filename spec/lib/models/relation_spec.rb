require 'spec_helper'

describe AlchemyLanguage::Relation do
  include AlchemyLanguage
  let(:self_class) { AlchemyLanguage::Relation }
  subject(:relation) { self_class.new("path", "url") }

  before(:each) do
    allow(RestClient).to receive("get").and_return(json_response("relation.json"))
  end

  it_should_behave_like "model_accessor"

  describe "#add_response_field" do

    it_should_behave_like "same_response_fields", "relation"

    it "relation class has method called language and return result from json_result" do
      is_expected.to respond_to(:language)
    end

    it "language method return hash from json_result['totalTransactions']" do
      expect(relation.language).to eq(relation.json_result["language"])
    end

    it "relation class has method called relations and return result from json_result" do
      is_expected.to respond_to(:relations)
    end

    it "relations method return hash from json_result['relations']" do
      expect(relation.relations).to eq(relation.json_result["relations"])
    end
  end

  describe "initialize" do
    it "path instance variable" do
      expect(relation.path).to eq("path")
    end

    it "auth_token instance variable" do
      expect(relation.auth_token).to eq(AlchemyLanguage.secret_token)
    end
  end

  describe "#end_point" do
    let(:complete_path) { "url/URLGetRelations?apikey=da431323d51965268639e605b3c78169f710b86a&url=path&outputMode=json" }
    it "get end point with auth_token and path" do
      expect(relation.end_point).to eq(complete_path)
    end
  end

  describe "#result" do
    it "return all result after request with relation url" do
      expect(relation.result).to eq(json_response("relation.json", json_parse: true))
    end
  end
end
