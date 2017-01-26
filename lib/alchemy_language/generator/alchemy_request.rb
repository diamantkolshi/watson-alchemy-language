module AlchemyLanguage
  module Generators
    module AlchemyRequest
      def base_url
        "#{AlchemyLanguage.base_url_request}"
      end

      def rest_client_api(request_api)
        RestClient.get(request_api)
      end

      def json_parser(url)
        JSON.parse(rest_client_api(base_url + "/" + url))
      end
    end
  end
end