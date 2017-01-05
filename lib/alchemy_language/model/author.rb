module AlchemyLanguage
  class Author
    attr_accessor :path, :auth_token

    def initialize(path)
      @path = path
      @auth_token = AlchemyLanguage.secret_token
      make_request
    end

    def extra_path
      "url/URLGetAuthors?apikey=#{@auth_token}&url=#{@path}"
    end

    def make_request
      AlchemyLanguage::Generators::RequestApi.new(extra_path)
    end
  end
end
