require 'spec_helper'

describe AlchemyLanguage::Keyword do
  include AlchemyLanguage
  let(:self_class) { AlchemyLanguage::Keyword }
  subject(:keyword) { self_class.new("path", "url") }

  before(:each) do
    allow(RestClient).to receive("get").and_return(json_response("keyword.json"))
  end

  it_should_behave_like "model_accessor"

  describe "#add_response_field" do

    it_should_behave_like "same_response_fields", "keyword"

    it "keyword class has method called totalTransactions and return result from json_result" do
      is_expected.to respond_to(:totalTransactions)
    end

    it "totalTransactions method return hash from json_result['totalTransactions']" do
      expect(keyword.totalTransactions).to eq(keyword.json_result["totalTransactions"])
    end

    it "keyword class has method called language and return result from json_result" do
      is_expected.to respond_to(:language)
    end

    it "language method return hash from json_result['totalTransactions']" do
      expect(keyword.language).to eq(keyword.json_result["language"])
    end

    it "keyword class has method called keywords and return result from json_result" do
      is_expected.to respond_to(:keywords)
    end

    it "keywords method return hash from json_result['keywords']" do
      expect(keyword.keywords).to eq(keyword.json_result["keywords"])
    end
  end

  it_should_behave_like "initialize_model", "keyword"

  it_should_behave_like "operation_methods", "keyword" ,"url/URLGetRankedKeywords"

end
