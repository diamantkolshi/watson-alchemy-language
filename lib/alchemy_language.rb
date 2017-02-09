require 'rest-client'
require 'json'

module AlchemyLanguage
  class << self
    def base_url_request
      "https://gateway-a.watsonplatform.net/calls"
    end

    def secret_token
      "da431323d51965268639e605b3c78169f710b86a"
    end
  end
end




require "alchemy_language/model/date_extraction.rb"
require "alchemy_language/model/emotion_analysis.rb"	
require "alchemy_language/model/targeted_emotion.rb"		 
require "alchemy_language/model/entity.rb"
require "alchemy_language/model/feed_detection.rb"
require "alchemy_language/model/keyword.rb"
require "alchemy_language/model/language_detection.rb"
require "alchemy_language/model/microformat.rb"
require "alchemy_language/model/publication_date.rb"
require "alchemy_language/model/relation.rb"
require "alchemy_language/model/typed_relation.rb"
require "alchemy_language/model/sentiment_analysis.rb"
require "alchemy_language/model/targeted_sentiment.rb"
require "alchemy_language/model/taxonomy.rb"
require "alchemy_language/model/text.rb"
require "alchemy_language/model/raw_text.rb"
require "alchemy_language/model/title_extraction.rb"
require "alchemy_language/url_service.rb"		  "

# obj = AlchemyLanguage::UrlService.new("http://www.ibm.com/watson/")
# puts obj.author.status