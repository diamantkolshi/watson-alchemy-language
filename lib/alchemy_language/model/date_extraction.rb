module AlchemyLanguage
  class DateExtraction < ActiveModel::Base
    add_response_field(:totalTransactions)
    add_response_field(:language)
    add_response_field(:dates)

    def endpoint
      "#{@type}/URLExtractDates?apikey=#{@auth_token}&url=#{@path}&outputMode=json"
    end
  end
end
