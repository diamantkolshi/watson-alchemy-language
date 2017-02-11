require 'spec_helper'

describe AlchemyLanguage::Author do
  include AlchemyLanguage
  let(:self_class) { AlchemyLanguage::Author }
  subject(:author) { self_class.new("path", "url") }

  before(:each) do
    allow(RestClient).to receive("get").and_return(json_response("author.json"))
  end

  it_should_behave_like "model_accessor"

  describe "#add_response_field" do

    it_should_behave_like "same_response_fields", "author"

    it "author class has method called authors and return result from json_result" do
      is_expected.to respond_to(:authors)
    end

    it "authors method return hash from json_result['authors']" do
      expect(author.authors).to eq({"names"=>["Author Name 1", "Author Name 2"]})
    end
  end

  it_should_behave_like "initialize_model", "author"

  it_should_behave_like "operation_methods", "author" ,"url/URLGetAuthors" 
end
