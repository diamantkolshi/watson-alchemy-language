module AlchemyLanguage
  class UrlService < ActiveMethod::Base
    attr_accessor :path, :type

    define_component :author

    def initialize(path)
      is_url?
      @path = path
      @type = "url"
    end

    def is_url?
      return "params is not url" if check_url.nil?
    end

    def check_url
      @path =~ URI::regexp(["ftp", "http", "https"])
    end
  end
end
