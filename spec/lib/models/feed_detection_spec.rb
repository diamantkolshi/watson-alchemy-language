require 'spec_helper'

describe AlchemyLanguage::FeedDetection do
  include AlchemyLanguage
  let(:self_class) { AlchemyLanguage::FeedDetection }
  subject(:feed_detection) { self_class.new("path", "url") }

  before(:each) do
    allow(RestClient).to receive("get").and_return(json_response("feed_detection.json"))
  end

  it_should_behave_like "model_accessor"

  describe "#add_response_field" do

    it_should_behave_like "same_response_fields", "feed_detection"

    it "feed_detection class has method called feeds and return result from json_result" do
      is_expected.to respond_to(:feeds)
    end

    it "authors method return hash from json_result['authors']" do
      expect(feed_detection.feeds).to eq(feed_detection.json_result["feeds"])
    end
  end

  describe "initialize" do
    it "path instance variable" do
      expect(feed_detection.path).to eq("path")
    end

    it "auth_token instance variable" do
      expect(feed_detection.auth_token).to eq(AlchemyLanguage.secret_token)
    end
  end

  describe "#end_point" do
    let(:complete_path) { "url/URLGetFeedLinks?apikey=#{feed_detection.auth_token}&url=#{feed_detection.path}&outputMode=json" }
    it "get end point with auth_token and path" do
      expect(feed_detection.end_point).to eq(complete_path)
    end
  end

  describe "#result" do
    it "return all result after request with feed_detection url" do
      expect(feed_detection.result).to eq(json_response("feed_detection.json", json_parse: true))
    end
  end
end
