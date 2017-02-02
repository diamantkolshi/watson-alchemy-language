module AlchemyLanguage
  class Concept < ActiveMethod::Extra
    include AlchemyLanguage::Generators::AlchemyRequest
    attr_accessor :path, :auth_token, :type, :json_result

    add_method(:status)
    add_method(:usage)
    add_method(:url)
    add_method(:concepts)

    def initialize(path, type)
      @path = path
      @auth_token = AlchemyLanguage.secret_token
      @type = type
      @json_result = request
    end

    def end_point
      "#{@type}/URLGetRankedConcepts?apikey=#{@auth_token}&url=#{@path}&outputMode=json"
    end

    def request
      json_parser(end_point)
    end
  end
end
