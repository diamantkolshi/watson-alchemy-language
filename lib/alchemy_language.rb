require 'rest-client'
require 'json'
require "addressable/uri"

module AlchemyLanguage
  class << self
    def base_url_request
      "https://gateway-a.watsonplatform.net/calls"
    end

    def secret_token
      # ENV['token']
      "da431323d51965268639e605b3c78169f710b86a"
    end
  end
end

require_relative  "alchemy_language/active_method/base.rb"
require_relative  "alchemy_language/active_method/extra.rb"
require_relative  "alchemy_language/generator/alchemy_request.rb"
require_relative  "alchemy_language/active_model/base.rb"
require_relative  "alchemy_language/model/author.rb"
require_relative  "alchemy_language/model/concept.rb"
require_relative  "alchemy_language/model/date_extraction.rb"
require_relative  "alchemy_language/model/emotion_analysis.rb"
require_relative  "alchemy_language/model/targeted_emotion.rb"
require_relative  "alchemy_language/model/entity.rb"
require_relative  "alchemy_language/model/feed_detection.rb"
require_relative  "alchemy_language/model/keyword.rb"
require_relative  "alchemy_language/model/language_detection.rb"
require_relative  "alchemy_language/model/microformat.rb"
require_relative  "alchemy_language/model/publication_date.rb"
require_relative  "alchemy_language/model/relation.rb"
require_relative  "alchemy_language/model/typed_relation.rb"
require_relative  "alchemy_language/model/sentiment_analysis.rb"
require_relative  "alchemy_language/model/targeted_sentiment.rb"
require_relative  "alchemy_language/model/taxonomy.rb"
require_relative  "alchemy_language/model/text.rb"
require_relative  "alchemy_language/model/raw_text.rb"
require_relative  "alchemy_language/model/title_extraction.rb"
require_relative  "alchemy_language/model/combined_call.rb"
require_relative  "alchemy_language/url_service.rb"
require_relative  "alchemy_language/text_service.rb"

# obj = AlchemyLanguage::UrlService.new("https://www.ibm.com/us-en/")
# puts obj.combined_call(extract: "entities,keywords").result["entities"]
