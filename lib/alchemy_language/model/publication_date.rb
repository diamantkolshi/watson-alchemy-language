module AlchemyLanguage
  class PublicationDate < ActiveModel::Base
    add_response_field(:totalTransactions)
    add_response_field(:language)
    add_response_field(:publicationDate)	

    def endpoint
      "#{@type}/URLGetPubDate?apikey=#{@auth_token}&url=#{@path}&outputMode=json"
    end
  end
end
