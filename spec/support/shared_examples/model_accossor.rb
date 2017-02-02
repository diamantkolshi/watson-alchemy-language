RSpec.shared_examples "model_accessor" do
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
end