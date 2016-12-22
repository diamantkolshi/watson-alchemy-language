
module AlchemyLanguage
	class RequestApi
		attr_accessor :path_request

		def initialize(request)
			@path_request = request
			request_path
		end

		def request_path
			puts "#{AlchemyLanguage.url_request}/#{@path_request}"
		end
	end
end