module AlchemyLanguage
  class TextService < ActiveMethod::Base
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
    define_model :raw_text
    define_model :title_extraction
    define_model :combined_call

    def initialize(text)
      @path = text
      @type = "text"
    end
  end
end
