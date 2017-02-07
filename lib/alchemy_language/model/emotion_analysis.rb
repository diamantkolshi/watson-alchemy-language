module AlchemyLanguage
  class EmotionAnalysis < ActiveModel::Base
    add_response_field(:totalTransactions)
    add_response_field(:language)
    add_response_field(:docEmotions)

    def end_point
      "#{@type}/URLGetEmotion?apikey=#{@auth_token}&url=#{@path}&outputMode=json"
    end
  end
end
