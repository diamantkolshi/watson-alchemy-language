module AlchemyLanguage
  module ActiveModel
    class Base < ActiveMethod::Extra
      include AlchemyLanguage::Generators::AlchemyRequest
      attr_accessor :path, :auth_token, :type, :json_result

      add_response_field(:status)
      add_response_field(:usage)
      add_response_field(:url)

      def initialize(path, type)
        @path = path
        @auth_token = AlchemyLanguage.secret_token
        @type = type
        @json_result = request
      end

      def request
        json_parser(endpoint)
      end
    end
  end
end
