require 'spec_helper'

describe AlchemyLanguage::DateExtraction do
  include AlchemyLanguage
  let(:self_class) { AlchemyLanguage::DateExtraction }
  subject(:date_extraction) { self_class.new("path", "url") }

  before(:each) do
    allow(RestClient).to receive("get").and_return(json_response("date_extraction.json"))
  end

  it_should_behave_like "model_accessor"

  describe "#add_response_field" do

    it_should_behave_like "same_response_fields", "date_extraction"

    it "date_extraction class has method called totalTransactions and return result from json_result" do
      is_expected.to respond_to(:totalTransactions)
    end

    it "totalTransactions method return hash from json_result['totalTransactions']" do
      expect(date_extraction.totalTransactions).to eq(date_extraction.json_result["totalTransactions"])
    end

    it "date_extraction class has method called language and return result from json_result" do
      is_expected.to respond_to(:language)
    end

    it "language method return hash from json_result['totalTransactions']" do
      expect(date_extraction.language).to eq(date_extraction.json_result["language"])
    end

    it "date_extraction class has method called dates and return result from json_result" do
      is_expected.to respond_to(:dates)
    end

    it "dates method return hash from json_result['totalTransactions']" do
      expect(date_extraction.dates).to eq(date_extraction.json_result["dates"])
    end
  end

  it_should_behave_like "initialize_model", "date_extraction"

  it_should_behave_like "operation_methods", "date_extraction" ,"url/URLExtractDates"

end
