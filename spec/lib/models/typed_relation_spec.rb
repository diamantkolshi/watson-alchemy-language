require 'spec_helper'

describe AlchemyLanguage::TypedRelation do
  include AlchemyLanguage
  let(:self_class) { AlchemyLanguage::TypedRelation }
  subject(:typed_relation) { self_class.new("path", "url") }

  before(:each) do
    allow(RestClient).to receive("get").and_return(json_response("typed_relation.json"))
  end

  it_should_behave_like "model_accessor"

  describe "#add_response_field" do

    it_should_behave_like "same_response_fields", "typed_relation"

    it "typed_relation class has method called totalTransactions and return result from json_result" do
      is_expected.to respond_to(:totalTransactions)
    end

    it "totalTransactions method return hash from json_result['totalTransactions']" do
      expect(typed_relation.totalTransactions).to eq(typed_relation.json_result["totalTransactions"])
    end

    it "typed_relation class has method called language and return result from json_result" do
      is_expected.to respond_to(:language)
    end

    it "language method return hash from json_result['totalTransactions']" do
      expect(typed_relation.language).to eq(typed_relation.json_result["language"])
    end

    it "typed_relation class has method called typedRelations and return result from json_result" do
      is_expected.to respond_to(:typedRelations)
    end

    it "typedRelations method return hash from json_result['typedRelations']" do
      expect(typed_relation.typedRelations).to eq(typed_relation.json_result["typedRelations"])
    end
  end

  it_should_behave_like "initialize_model", "typed_relation"

  it_should_behave_like "operation_methods", "typed_relation" ,"url/URLGetTypedRelations"

end
