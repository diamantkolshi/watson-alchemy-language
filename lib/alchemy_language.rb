Dir.glob(File.join("alchemy_language", "**", "*.rb")).each do |klass|
  require_relative klass
end
require 'uri'
require 'rest-client'

module AlchemyLanguage
	class << self
	  def base_url_request
	    "https://gateway-a.watsonplatform.net/calls"
	  end

	  def secret_token
	    "secret-token"
	  end
	end		
end

# obj = AlchemyLanguage::UrlService.new("www.ibm.com")
# puts obj.author.status