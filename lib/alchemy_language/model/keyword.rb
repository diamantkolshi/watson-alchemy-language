module AlchemyLanguage
  class Keyword < ActiveModel::Base
    add_response_field(:totalTransactions)
    add_response_field(:language)
    add_response_field(:keywords)

    def end_point
      "#{@type}/URLGetRankedKeywords?apikey=#{@auth_token}&url=#{@path}&outputMode=json"
    end
  end
end
