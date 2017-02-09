RSpec.shared_examples "initialize_model" do |model_name|
  describe "initialize" do
    it "path instance variable" do
      expect(eval("#{model_name}").path).to eq("path")
    end

    it "auth_token instance variable" do
      expect(eval("#{model_name}").auth_token).to eq(AlchemyLanguage.secret_token)
    end
  end
end
