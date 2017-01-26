require 'spec_helper'
require_relative '../../../lib/alchemy_language/active_method/base'

describe AlchemyLanguage::ActiveMethod::Base do
  subject(:base) { AlchemyLanguage::ActiveMethod::Base }
  let(:request_key) { "#{AlchemyLanguage.base_url_request}/url/URLGetAuthors?apikey=#{AlchemyLanguage.secret_token}&url=www.ibm.com&outputMode=json" }

  it "has instance variable with full url for verify secret api key" do
    expect(base.class_variable_get(:@@auth_url)).to eq(request_key)
  end

  it "has instance key that in start it is nil" do
    expect(base.new.json_res).to eq(nil)
  end

  it "has self method that it called define_component" do
    is_expected.to respond_to(:define_model)
  end

  describe "define dynamic methods " do
    subject(:instance_base) { base.new }

    it "define methods dinamix with define component method" do
      is_expected.not_to respond_to(:test_method)

      base.define_model :test_method

      is_expected.to respond_to(:test_method)
    end

    it "involved class whitch named with name params" do
    end
  end

  describe ".authenticate!" do
    context "when api key is valid" do
      before(:each) do
        allow(base).to receive(:authenticate_successfully?).and_return(true)
      end
      it "authenticate successfully" do
        expect(base.authenticate!).to eq(nil)
      end
    end

    context "when api key is not valid" do
      before(:each) do
        allow(base).to receive(:authenticate_successfully?).and_return(false)
      end
      it "authenticate failure" do
        expect(base.authenticate!).to eq("secret key is not valid")
      end
    end
  end


  describe ".athenticate_successfully" do
    context "when api key is valid" do
      before(:example) do
        allow(base).to receive(:valid_api_key?).and_return(true)
      end

      it "key is valid" do
        expect(base.authenticate_successfully?).to eq(true)
      end
    end

    context "when api key is invalid" do
      before(:example) do
        allow(base).to receive(:valid_api_key?).and_return(false)
      end

      it "key is invalid" do
        expect(base.authenticate_successfully?).to eq(false)
      end
    end
  end

  describe ".valid_api_key?" do
    context "when api key is valid" do
      it "key is valid" do
        allow(base).to receive(:json_parser).and_return(default_api_result)
        expect(base.valid_api_key?).to eq(true)
      end
    end
    context "when api key is invalid" do
      it "key is invalid" do
        allow(base).to receive(:json_parser).and_return(error_api_key)
        expect(base.valid_api_key?).to eq(false)
      end
    end
  end
end
