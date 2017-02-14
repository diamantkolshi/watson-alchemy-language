require 'spec_helper'

describe AlchemyLanguage::CombinedCall do
  include AlchemyLanguage
  subject(:combined_call) { described_class.new("path", "url") }

  before(:each) do
    allow(RestClient).to receive("get").and_return(json_response("combined_call.json"))
  end

  it_should_behave_like "model_accessor"

  describe "#add_response_field" do
    it_should_behave_like "same_response_fields", "combined_call"

    it "combined_call class has method called totalTransactions and return result from json_result" do
      is_expected.to respond_to(:totalTransactions)
    end

    it "totalTransactions method return hash from json_result['totalTransactions']" do
      expect(combined_call.totalTransactions).to eq(combined_call.json_result["totalTransactions"])
    end

    it "combined_call class has method called language and return result from json_result" do
      is_expected.to respond_to(:language)
    end

    it "language method return hash from json_result['language']" do
      expect(combined_call.language).to eq(combined_call.json_result["language"])
    end
  end

  it_should_behave_like "initialize_model", "combined_call"

  it_should_behave_like "operation_methods", "combined_call" ,"url/URLGetCombinedData"

  describe "#check_options" do
    it "when options is empty check_options does nothing" do
      expect(combined_call.check_options).to eq(nil)
    end

    it "when option is not empty" do
      combined_call.instance_variable_set(:@options, { extract: "keywords,entitetis" })
      expect(combined_call.check_options).to eq(["keywords","entitetis"])
    end
  end

  describe "#add_dynamic_response_field" do
    it "when options is not empty subject has each options like method" do
      is_expected.to respond_to(:keywords)
      is_expected.to respond_to(:entitetis)
    end
    it "when options is emoty subject has not options method" do
      combined_call.instance_variable_set(:@options, nil)
      is_expected.to respond_to(:keywords)
      is_expected.to respond_to(:entitetis)
    end
  end
end
