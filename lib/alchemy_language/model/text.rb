module AlchemyLanguage
  class Text < ActiveModel::Base
    add_response_field(:language)
    add_response_field(:text)

    def end_point
      "#{@type}/URLGetText?apikey=#{@auth_token}&url=#{@path}&outputMode=json"
    end
  end
end
