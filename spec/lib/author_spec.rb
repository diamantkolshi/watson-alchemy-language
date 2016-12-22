require 'spec_helper'

describe AlchemyLanguage::Author do
  describe "name of Author" do

  	let(:author) { AlchemyLanguage::Author.new("author") }

  	it "return name successfully" do
  		author_name = author.name  
  		expect(author.name).to eq(author_name)
  	end
  end
end


