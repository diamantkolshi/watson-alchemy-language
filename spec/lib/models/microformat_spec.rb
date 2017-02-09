require 'spec_helper'

describe AlchemyLanguage::Microformat do
  include AlchemyLanguage
  let(:self_class) { AlchemyLanguage::Microformat }
  subject(:microformat) { self_class.new("path", "url") }

  before(:each) do
    allow(RestClient).to receive("get").and_return(json_response("microformat.json"))
  end

  it_should_behave_like "model_accessor"

  describe "#add_response_field" do

    it_should_behave_like "same_response_fields", "microformat"

    it "microformat class has method called microformats and return result from json_result" do
      is_expected.to respond_to(:microformats)
    end

    it "microformats method return hash from json_result['microformats']" do
      expect(microformat.microformats).to eq(microformat.json_result["microformats"])
    end
  end

  describe "initialize" do
    it "path instance variable" do
      expect(microformat.path).to eq("path")
    end

    it "auth_token instance variable" do
      expect(microformat.auth_token).to eq(AlchemyLanguage.secret_token)
    end
  end

  describe "#end_point" do
    let(:complete_path) { "url/URLGetMicroformatData?apikey=#{microformat.auth_token}&url=#{microformat.path}&outputMode=json" }
    it "get end point with auth_token and path" do
      expect(microformat.end_point).to eq(complete_path)
    end
  end

  describe "#result" do
    it "return all result after request with microformat url" do
      expect(microformat.result).to eq(json_response("microformat.json", json_parse: true))
    end
  end
end
