require 'spec_helper'
require_relative '../../lib/alchemy_language/generator/request_api'
require_relative '../../lib/alchemy_language/model/author'

describe AlchemyLanguage::Author do
  let(:author) {  AlchemyLanguage::Author.new("/path", "url") }

  describe "initialize" do
    it "path instance variable" do
      expect(author.path).to eq("/path")
    end

    it "auth_token instance variable" do
      expect(author.auth_token).to eq(AlchemyLanguage.secret_token)
    end
  end

  describe "#extra_path" do
    let(:complete_path) { "url/URLGetAuthors?apikey=#{author.auth_token}&url=#{author.path}" }
    it "get extra path with auth_token and path" do
      expect(author.extra_path).to eq(complete_path)
    end
  end
end
