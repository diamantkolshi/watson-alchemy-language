Dir.glob(File.join("alchemy_language", "**", "*.rb")).each do |klass|
  require_relative klass
end
require 'uri'
require 'rest-client'

module AlchemyLanguage
  def self.base_url_request
    "https://gateway-a.watsonplatform.net/calls"
  end

  def self.secret_token
    "secret_token"
  end
end
# obj = AlchemyLanguage::UrlService.new("www.ibm.com")
# obj.author