module AlchemyLanguage
  module ActiveModel
    class Base < ActiveMethod::Extra
      include AlchemyLanguage::Generators::AlchemyRequest
      attr_accessor :path, :auth_token, :type, :json_result

      add_method(:status)
      add_method(:usage)
      add_method(:url)

      def initialize(path, type)
        @path = path
        @auth_token = AlchemyLanguage.secret_token
        @type = type
        @json_result = request
      end

      def request
        json_parser(end_point)
      end
    end
  end
end
