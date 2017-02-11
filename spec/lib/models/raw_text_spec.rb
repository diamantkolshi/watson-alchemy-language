require 'spec_helper'

describe AlchemyLanguage::RawText do
  include AlchemyLanguage
  let(:self_class) { AlchemyLanguage::RawText }
  subject(:raw_text) { self_class.new("path", "url") }

  before(:each) do
    allow(RestClient).to receive("get").and_return(json_response("raw_text.json"))
  end

  it_should_behave_like "model_accessor"

  describe "#add_response_field" do

    it_should_behave_like "same_response_fields", "raw_text"

    it "raw_text class has method called text and return result from json_result" do
      is_expected.to respond_to(:text)
    end

    it "text method return hash from json_result['text']" do
      expect(raw_text.text).to eq(raw_text.json_result["text"])
    end
  end

  it_should_behave_like "initialize_model", "raw_text"

  it_should_behave_like "operation_methods", "raw_text" ,"url/URLGetRawText"

end
