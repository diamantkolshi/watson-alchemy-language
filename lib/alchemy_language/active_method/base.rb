require 'active_support/core_ext/string'
module AlchemyLanguage
  module ActiveMethod
    class Base
      @@auth_url ="#{AlchemyLanguage.base_url_request}/url/URLGetAuthors?apikey=#{AlchemyLanguage.secret_token}&url=www.ibm.com&outputMode=json"
      attr_accessor :json_res

      class << self
        def define_model(name)
          define_method(name) do |options = {}|
            eval("#{name.to_s.classify}").new(@path, @type, options)
          end
        end

        def before_request(name)
          send name
        end

        def authenticate!
          return "secret key is not valid" unless authenticate_successfully?
        end

        def authenticate_successfully?
          @json_res = RestClient.get(@@auth_url)
          valid_api_key? ? true : false
        end

        def valid_api_key?
          !json_parser.key?("statusInfo")
        end

        def json_parser
          parse_in_json = JSON.parse(@json_res)
        end
      end
    end
  end
end
