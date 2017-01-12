module AlchemyLanguage
  module Generators
    class AlchemyRequest
      attr_accessor :url, :request_path

      def initialize(url)
        @url = url
        @request_url = base_url + "/" + @url
      end

      def base_url
        "#{AlchemyLanguage.base_url_request}"
      end
    end
  end
end
