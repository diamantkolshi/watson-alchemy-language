module AlchemyLanguage
  class Concept < ActiveModel::Base
    add_response_field(:concepts)

    def endpoint
      url = "#{@type}/#{@prefix}GetRankedConcepts"
      url << "?apikey=#{@auth_token}"
      url << "&#{@type}=#{@path}&outputMode=json"
      url << "&#{params_addressable}" unless params_addressable.empty?
      url
    end
  end
end
