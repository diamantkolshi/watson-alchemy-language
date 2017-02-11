require 'spec_helper'

describe AlchemyLanguage::Text do
  include AlchemyLanguage
  let(:self_class) { AlchemyLanguage::Text }
  subject(:text) { self_class.new("path", "url") }

  before(:each) do
    allow(RestClient).to receive("get").and_return(json_response("text.json"))
  end

  it_should_behave_like "model_accessor"

  describe "#add_response_field" do

    it_should_behave_like "same_response_fields", "text"

    it "text class has method called language and return result from json_result" do
      is_expected.to respond_to(:language)
    end

    it "language method return hash from json_result['totalTransactions']" do
      expect(text.language).to eq(text.json_result["language"])
    end

    it "text class has method called text and return result from json_result" do
      is_expected.to respond_to(:text)
    end

    it "text method return hash from json_result['totalTransactions']" do
      expect(text.text).to eq(text.json_result["text"])
    end
  end

  it_should_behave_like "initialize_model", "text"

  it_should_behave_like "operation_methods", "text" ,"url/URLGetText"

end
