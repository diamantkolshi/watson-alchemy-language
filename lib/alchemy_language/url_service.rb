module AlchemyLanguage
  class UrlService < ActiveMethod::Base
    attr_accessor :path, :type
    before_request :authenticate!

    define_model :author
    define_model :concept
    define_model :date_extraction
    define_model :emotion_analysis
    define_model :targeted_emotion
    define_model :entity
    define_model :feed_detaction
    define_model :keyword
    define_model :language_detection
    define_model :microformat
    define_model :publication_date
    define_model :relation
    define_model :typed_relation
    define_model :sentiment_analysis
    define_model :targeted_sentiment
    define_model :taxonomy
    define_model :text

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
