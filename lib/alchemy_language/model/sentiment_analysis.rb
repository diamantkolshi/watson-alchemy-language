module AlchemyLanguage
  class SentimentAnalysis < ActiveModel::Base
    add_response_field(:totalTransactions)
    add_response_field(:language)
    add_response_field(:docSentiment)

    def endpoint
      url = "#{@type}/#{@prefix}GetTextSentiment"
      url << "?apikey=#{@auth_token}"
      url << "&#{@type}=#{@path}&outputMode=json"
      url << "&#{params_addressable}" unless params_addressable.empty?
      url
    end
  end
end
