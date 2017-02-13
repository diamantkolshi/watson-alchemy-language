RSpec.shared_examples "model_accessor" do

  it "is inherited with base model" do
    expect(described_class).to be < AlchemyLanguage::ActiveModel::Base
  end

  it "has accessor for path" do
    is_expected.to respond_to(:path)
  end

  it "has accessor for auth_token" do
    is_expected.to respond_to(:auth_token)
  end

  it "has accessor for type" do
    is_expected.to respond_to(:type)
  end

  it "has accessor for json_result" do
    is_expected.to respond_to(:json_result)
  end

  it "has accessor for options" do
    is_expected.to respond_to(:options)
  end

  it "has accessor for prefix" do
    is_expected.to respond_to(:prefix)
  end
end
