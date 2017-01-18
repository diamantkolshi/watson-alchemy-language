module AlchemyLanguage
  class Author < ActiveMethod::Extra
    attr_accessor :path, :auth_token, :type

    add_method(:status) { 200 }

    def initialize(path, type)
      @path = path
      @auth_token = AlchemyLanguage.secret_token
      @type = type
      request
    end

    def end_point
      "#{@type}/URLGetAuthors?apikey=#{@auth_token}&url=#{@path}"
    end

    def request
      AlchemyLanguage::Generators::AlchemyRequest.new(end_point)
    end
  end
end
