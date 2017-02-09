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

  it_should_behave_like "initialize_model", "microformat"

  it_should_behave_like "operation_methods", "microformat" ,"url/URLGetMicroformatData"

end
