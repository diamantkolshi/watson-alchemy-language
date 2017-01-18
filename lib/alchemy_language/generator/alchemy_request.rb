require 'rest-client'
require 'json'

module AlchemyLanguage
  module Generators
    class AlchemyRequest
      attr_accessor :url, :request_path, :api_request, :json_result

      def initialize(url)
        @url = url
        @request_path = base_url + "/" + @url
        @request_path = @url
        # @api_request = rest_client_api
      end

      def base_url
        "#{AlchemyLanguage.base_url_request}"
      end

      def rest_client_api
        RestClient.get(@request_path)
      end

      def json_parser
        @json_result = JSON.parse(@api_request)
      end 
    end
  end
end
