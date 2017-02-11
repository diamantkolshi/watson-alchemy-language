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

  it_should_behave_like "initialize_model", "entity"

  it_should_behave_like "operation_methods", "entity" ,"url/URLGetRankedNamedEntities"

end
