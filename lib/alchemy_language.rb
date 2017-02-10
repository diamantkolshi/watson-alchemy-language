require 'rest-client'
require 'json'

module AlchemyLanguages
  class << self
    def base_url_request
      "https://gateway-a.watsonplatform.net/calls"
    end

    def secret_token
      "da431323d51965268639e605b3c78169f710b86a"
    end
  end
end

require "alchemy_lang-uage/active_method/base.rb"
require "alchemy_language/active_method/extra.rb"
require "alchemy_language/generator/alchemy_request.rb"
require "alchemy_language/active_model/base.rb"
require "alchemy_language/model/author.rb"
require "alchemy_language/model/concept.rb"
require "alchemy_language/model/date_extraction.rb"
require "alchemy_language/model/emotion_analysis.rb"
require "alchemy_language/model/targeted_emotion.rb"
require "alchemy_language/url_service.rb"

# obj = AlchemyLanguage::UrlService.new("http://www.ibm.com/watson/")
# puts obj.author.status