require 'spec_helper'

describe AlchemyLanguage::PublicationDate do
  include AlchemyLanguage
  let(:self_class) { AlchemyLanguage::PublicationDate }
  subject(:publication_date) { self_class.new("path", "url") }

  before(:each) do
    allow(RestClient).to receive("get").and_return(json_response("publication_date.json"))
  end

  it_should_behave_like "model_accessor"

  describe "#add_response_field" do

    it_should_behave_like "same_response_fields", "publication_date"

    it "publication_date class has method called totalTransactions and return result from json_result" do
      is_expected.to respond_to(:totalTransactions)
    end

    it "totalTransactions method return hash from json_result['totalTransactions']" do
      expect(publication_date.totalTransactions).to eq(publication_date.json_result["totalTransactions"])
    end

    it "publication_date class has method called language and return result from json_result" do
      is_expected.to respond_to(:language)
    end

    it "language method return hash from json_result['totalTransactions']" do
      expect(publication_date.language).to eq(publication_date.json_result["language"])
    end

    it "publication_date class has method called publicationDate and return result from json_result" do
      is_expected.to respond_to(:publicationDate)
    end

    it "publicationDate method return hash from json_result['publicationDate']" do
      expect(publication_date.publicationDate).to eq(publication_date.json_result["publicationDate"])
    end
  end

  it_should_behave_like "initialize_model", "publication_date"

  it_should_behave_like "operation_methods", "publication_date" ,"url/URLGetPubDate"

end
