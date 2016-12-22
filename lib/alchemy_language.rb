Dir.glob(File.join("alchemy_language", "**", "*.rb")).each do |klass|
  require_relative klass
end
require 'uri'
require 'rest-client'

module AlchemyLanguage
  def self.url_request
    url = "https://gateway-a.watsonplatform.net/calls"
  end

  def self.secret_token
  end
end

# obj = AlchemyLanguage::UrlService.new("www.ibm.com")

