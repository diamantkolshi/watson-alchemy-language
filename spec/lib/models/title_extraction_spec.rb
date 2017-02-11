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

  it_should_behave_like "initialize_model", "title_extraction"

  it_should_behave_like "operation_methods", "title_extraction" ,"url/URLGetTitle"

end
