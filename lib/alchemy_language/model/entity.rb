module AlchemyLanguage
  class Entity < ActiveModel::Base
    add_response_field(:language)
    add_response_field(:entities)

    def endpoint
      url = "#{@type}/#{@prefix}GetRankedNamedEntities"
      url << "?apikey=#{@auth_token}"
      url << "&#{@type}=#{@path}&outputMode=json"
      url << "&#{params_addressable}" unless params_addressable.empty?
      url
    end
  end
end
