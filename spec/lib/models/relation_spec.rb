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

  it_should_behave_like "initialize_model", "relation"

  it_should_behave_like "operation_methods", "relation" ,"url/URLGetRelations"

end
