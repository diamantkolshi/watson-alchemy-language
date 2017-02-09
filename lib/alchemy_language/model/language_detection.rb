module AlchemyLanguage
  class LanguageDetection < ActiveModel::Base
    add_response_field(:language)
    add_response_field(:iso_639_1)
    add_response_field(:iso_639_2)
    add_response_field(:iso_639_3)
    add_response_field(:ethnologue)
    add_response_field(:native_speakers)
    add_response_field(:wikipedia)

    def end_point
      "#{@type}/URLGetLanguage?apikey=#{@auth_token}&url=#{@path}&outputMode=json"
    end
  end
end
