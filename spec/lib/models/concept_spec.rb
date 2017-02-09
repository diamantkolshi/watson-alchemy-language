require 'spec_helper'

describe AlchemyLanguage::Concept do
  include AlchemyLanguage
  let(:self_class) { AlchemyLanguage::Concept }
  subject(:concept) { self_class.new("path", "url") }

  before(:each) do
    allow(RestClient).to receive("get").and_return(json_response("concept.json"))
  end

  it_should_behave_like "model_accessor"

  describe "#add_response_field" do
    it_should_behave_like "same_response_fields", "concept"

    it "concept class has method called concepts and return result from json_result" do
      is_expected.to respond_to(:concepts)
    end

    it "concepts method return hash from json_result['concepts']" do
      expect(concept.concepts).to eq(concept.json_result["concepts"])
    end
  end

  it_should_behave_like "initialize_model", "concept"

  it_should_behave_like "operation_methods", "concept" ,"url/URLGetRankedConcepts"

end
