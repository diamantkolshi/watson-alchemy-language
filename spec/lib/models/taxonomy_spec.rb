require 'spec_helper'

describe AlchemyLanguage::Taxonomy do
  include AlchemyLanguage
  let(:self_class) { AlchemyLanguage::Taxonomy }
  subject(:taxonomy) { self_class.new("path", "url") }

  before(:each) do
    allow(RestClient).to receive("get").and_return(json_response("taxonomy.json"))
  end

  it_should_behave_like "model_accessor"

  describe "#add_response_field" do

    it_should_behave_like "same_response_fields", "taxonomy"

    it "taxonomy class has method called totalTransactions and return result from json_result" do
      is_expected.to respond_to(:totalTransactions)
    end

    it "totalTransactions method return hash from json_result['totalTransactions']" do
      expect(taxonomy.totalTransactions).to eq(taxonomy.json_result["totalTransactions"])
    end

    it "taxonomy class has method called language and return result from json_result" do
      is_expected.to respond_to(:language)
    end

    it "language method return hash from json_result['totalTransactions']" do
      expect(taxonomy.language).to eq(taxonomy.json_result["language"])
    end

    it "taxonomy class has method called taxonomy and return result from json_result" do
      is_expected.to respond_to(:taxonomy)
    end

    it "taxonomy method return hash from json_result['totalTransactions']" do
      expect(taxonomy.taxonomy).to eq(taxonomy.json_result["taxonomy"])
    end
  end

  describe "initialize" do
    it "path instance variable" do
      expect(taxonomy.path).to eq("path")
    end

    it "auth_token instance variable" do
      expect(taxonomy.auth_token).to eq(AlchemyLanguage.secret_token)
    end
  end

  describe "#end_point" do
    let(:complete_path) { "url/URLGetRankedTaxonomy?apikey=da431323d51965268639e605b3c78169f710b86a&url=path&outputMode=json" }
    it "get end point with auth_token and path" do
      expect(taxonomy.end_point).to eq(complete_path)
    end
  end

  describe "#result" do
    it "return all result after request with taxonomy url" do
      expect(taxonomy.result).to eq(json_response("taxonomy.json", json_parse: true))
    end
  end
end
