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

  it_should_behave_like "initialize_model", "taxonomy"

  it_should_behave_like "operation_methods", "taxonomy" ,"url/URLGetRankedTaxonomy"

end
