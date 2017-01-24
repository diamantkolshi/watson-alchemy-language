require 'spec_helper'
require_relative '../../lib/alchemy_language/generator/alchemy_request'
require_relative '../../lib/alchemy_language/active_method/extra'
require_relative '../../lib/alchemy_language/model/author'

module AlchemyLanguage
  module Generators
    module AlchemyRequest
      def rest_client_api(request_api)
        author_api_result
      end
    end
  end
end

describe AlchemyLanguage::Author do
  let(:self_class) { AlchemyLanguage::Author }
  subject(:author) { self_class.new("path", "url") }

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

  describe "#add_method" do 
    it "author class has method called status and return result from json_result" do 
      is_expected.to respond_to(:status)
    end

    it "status method return hash from json_result['status']" do 
      expect(author.status).to eq("OK")
    end

    it "author class has method called status and return result from json_result" do 
      is_expected.to respond_to(:usage)
    end

    it "usage method return hash from json_result['usage']" do 
      expect(author.usage).to eq(author.json_result["usage"])
    end

    it "author class has method called url and return result from json_result" do 
      is_expected.to respond_to(:url)
    end

    it "url method return hash from json_result['url']" do 
      expect(author.url).to eq(author.json_result["url"])
    end

    it "author class has method called authors and return result from json_result" do 
      is_expected.to respond_to(:authors)
    end

    it "authors method return hash from json_result['authors']" do 
      binding.pry
      expect(author.authors).to eq({"names"=>["Author Name 1", "Author Name 2"]})
    end
  end

  describe "initialize" do
    it "path instance variable" do
      expect(author.path).to eq("path")
    end

    it "auth_token instance variable" do
      expect(author.auth_token).to eq(AlchemyLanguage.secret_token)
    end
  end

  describe "#end_point" do
    let(:complete_path) { "url/URLGetAuthors?apikey=#{author.auth_token}&url=#{author.path}&outputMode=json" }
    it "get end point with auth_token and path" do
      expect(author.end_point).to eq(complete_path)
    end
  end
end