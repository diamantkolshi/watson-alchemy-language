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

require_relative "alchemy_language/active_method/base.rb"
require_relative "alchemy_language/active_method/extra.rb"
require_relative "alchemy_language/generator/alchemy_request.rb"
require_relative "alchemy_language/active_model/base.rb"
require_relative "alchemy_language/model/author.rb"
require_relative "alchemy_language/model/concept.rb"
require_relative "alchemy_language/model/date_extraction.rb"
require_relative "alchemy_language/url_service.rb"

# obj = AlchemyLanguage::UrlService.new("http://www.ibm.com/watson/")
# puts obj.author.status