module AlchemyLanguage
  class UrlService
    include Generators::Methods
    attr_accessor :path

    def initialize(path)
      is_url?
      @path = path
    end

    def is_url?
      return "params is not url" if check_url.nil?
    end

    def check_url
      @path =~ URI::regexp(["ftp", "http", "https"])
    end
  end
end
