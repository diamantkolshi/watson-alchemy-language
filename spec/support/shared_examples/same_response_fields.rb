RSpec.shared_examples "same_response_fields" do |model_name|

  it "#{model_name} class has method called status and return result from json_result" do
    is_expected.to respond_to(:status)
  end

  it "status method return hash from json_result['status']" do
    expect(eval("#{model_name}").status).to eq("OK")
  end

  it "#{model_name} class has method called status and return result from json_result" do
    is_expected.to respond_to(:usage)
  end

  it "usage method return hash from json_result['usage']" do
    expect(eval("#{model_name}").usage).to eq(eval("#{model_name}").json_result["usage"])
  end

  it "#{model_name} class has method called url and return result from json_result" do
    is_expected.to respond_to(:url)
  end

  it "url method return hash from json_result['url']" do
    expect(eval("#{model_name}").url).to eq(eval("#{model_name}").json_result["url"])
  end
end
