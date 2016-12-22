module AlchemyLanguage
	class UrlService
		attr_accessor :url

		def initialize(path)
			is_url?
			@url = path
		end

		def is_url?	
			return "params is not url" if check_url.nil?
		end

		def check_url
			@url =~ URI::regexp(["ftp", "http", "https"])
		end

		def make_request_api
			AlchemyLanguage::RequestApi.new(@url)
		end
	end
end