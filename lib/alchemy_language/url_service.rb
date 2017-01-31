module AlchemyLanguage
  class UrlService < ActiveMethod::Base
    attr_accessor :path, :type
    before_request :authenticate!

    define_model :author

    def initialize(path)
      is_url?
      @path = path
      @type = "url"
    end

    def is_url?
      "params is not url" if check_url.nil?
    end

    def check_url
      @path =~ URI::regexp(["ftp", "http", "https"])
    end
  end
end
