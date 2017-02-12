module AlchemyLanguage
  module ActiveModel
    class Base < ActiveMethod::Extra
      include AlchemyLanguage::Generators::AlchemyRequest
      attr_accessor :path, :auth_token, :type, :json_result, :options, :prefix

      add_response_field(:status)
      add_response_field(:usage)
      add_response_field(:url)

      def initialize(path, type, options={})
        @path = path
        @auth_token = AlchemyLanguage.secret_token
        @type = type
        @options = options
        check_prefix
        @json_result = request
      end

      def request
        json_parser(endpoint)
      end

      def params_addressable
        uri = Addressable::URI.new
        uri.query_values = @options
        uri.query
      end

      def check_prefix
        @type == "text" ? @prefix = @type.capitalize : @prefix = @type.upcase
        require 'pry';binding.pry
      end
    end
  end
end
