RSpec.shared_examples "operation_methods" do |model_name, prefix|
  describe "#endpoint" do
    let(:instance_model) { eval("#{model_name}") }
    let(:complete_path) { "#{prefix}?apikey=#{instance_model.auth_token}&url=#{instance_model.path}&outputMode=json" }

    it "get end point with auth_token and path" do
      expect(eval("#{model_name}").endpoint).to eq(complete_path)
    end
  end

  describe "#result" do
    it "return all result after request with author url" do
      expect(eval("#{model_name}").result).to eq(json_response("#{model_name}.json", json_parse: true))
    end
  end
end
