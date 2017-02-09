module AlchemyLanguage
  class TitleExtraction < ActiveModel::Base
    add_response_field(:title)

    def end_point
      "#{@type}/URLGetTitle?apikey=#{@auth_token}&url=#{@path}&outputMode=json"
    end
  end
end
