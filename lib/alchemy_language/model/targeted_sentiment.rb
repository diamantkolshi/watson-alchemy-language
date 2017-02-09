module AlchemyLanguage
  class TargetedSentiment < ActiveModel::Base
    add_response_field(:totalTransactions)
    add_response_field(:language)
    add_response_field(:results)

    def endpoint
      "#{@type}/URLGetTargetedSentiment?apikey=#{@auth_token}&url=#{@path}&outputMode=json"
    end
  end
end
