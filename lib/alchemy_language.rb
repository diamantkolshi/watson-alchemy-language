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

<<<<<<< a0a210c2b6f6f8f673a28f7ca199d61340f3c424
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
require "alchemy_language/url_service.rb"
=======
require_relative "alchemy_language/active_method/base.rb"
require_relative "alchemy_language/active_method/extra.rb"
require_relative "alchemy_language/generator/alchemy_request.rb"
require_relative "alchemy_language/active_model/base.rb"
require_relative "alchemy_language/model/author.rb"
require_relative "alchemy_language/model/concept.rb"
require_relative "alchemy_language/model/date_extraction.rb"
require_relative "alchemy_language/model/emotion_analysis.rb"
require_relative "alchemy_language/model/targeted_emotion.rb"
require_relative "alchemy_language/model/entity.rb"
require_relative "alchemy_language/model/feed_detection.rb"
require_relative "alchemy_language/model/keyword.rb"
require_relative "alchemy_language/model/language_detection.rb"
require_relative "alchemy_language/model/microformat.rb"
require_relative "alchemy_language/model/publication_date.rb"
require_relative "alchemy_language/model/relation.rb"
require_relative "alchemy_language/model/typed_relation.rb"
require_relative "alchemy_language/model/sentiment_analysis.rb"
require_relative "alchemy_language/model/targeted_sentiment.rb"
require_relative "alchemy_language/model/taxonomy.rb"
require_relative "alchemy_language/url_service.rb"
>>>>>>> add typed_relation model

# obj = AlchemyLanguage::UrlService.new("http://www.ibm.com/watson/")
# puts obj.author.status
