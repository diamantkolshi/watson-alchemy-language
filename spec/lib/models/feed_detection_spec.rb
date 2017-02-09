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

  it_should_behave_like "initialize_model", "feed_detection"

  it_should_behave_like "operation_methods", "feed_detection" ,"url/URLGetFeedLinks"

end
