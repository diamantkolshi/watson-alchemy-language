
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

Dir.glob(File.join("alchemy_language", "**", "*.rb")).each do |klass|
  require_relative klass
end
