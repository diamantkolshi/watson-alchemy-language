module AlchemyLanguage
  class Author < ActiveMethod::Extra
    attr_accessor :path, :auth_token

    add_method(:status) { 200 }

    def initialize(path, type)
      @path = path
      @auth_token = AlchemyLanguage.secret_token
      @type = type
      make_request
    end

    def extra_path
      "#{@type}/URLGetAuthors?apikey=#{@auth_token}&url=#{@path}"
    end

    def make_request
      AlchemyLanguage::Generators::RequestApi.new(extra_path)
    end
  end
end
