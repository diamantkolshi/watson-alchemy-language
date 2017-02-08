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

  describe "initialize" do
    it "path instance variable" do
      expect(author.path).to eq("path")
    end

    it "auth_token instance variable" do
      expect(author.auth_token).to eq(AlchemyLanguage.secret_token)
    end
  end

  describe "#end_point" do
    let(:complete_path) { "url/URLGetAuthors?apikey=#{author.auth_token}&url=#{author.path}&outputMode=json" }
    it "get end point with auth_token and path" do
      expect(author.end_point).to eq(complete_path)
    end
  end

  describe "#result" do
    it "return all result after request with author url" do
      expect(author.result).to eq(json_response("author.json", json_parse: true))
    end
  end
end
