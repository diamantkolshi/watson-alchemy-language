module AlchemyLanguage
  class CombinedCall < ActiveModel::Base
    add_response_field(:totalTransactions)
    add_response_field(:language)
    
    def endpoint
      url = "#{@type}/#{@prefix}GetCombinedData"
      url << "?apikey=#{@auth_token}"
      url << "&#{@type}=#{@path}&outputMode=json"
      url << "&#{params_addressable}" unless params_addressable.empty?
      url
    end
  end
end