require 'spec_helper'

describe AlchemyLanguage do
  describe "return api key" do
  	it "return key successfully" do  
  		api_key = "12345678"
  		method_return = AlchemyLanguage.secret_token("12345678")
  		expect(method_return).to eq(api_key)
  	end
  end
end