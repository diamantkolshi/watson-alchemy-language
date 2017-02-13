module AlchemyLanguage
  class Relation < ActiveModel::Base
    add_response_field(:language)
    add_response_field(:relations)

    def endpoint
      url = "#{@type}/#{@prefix}GetRelations"
      url << "?apikey=#{@auth_token}"
      url << "&#{@type}=#{@path}&outputMode=json"
      url << "&#{params_addressable}" unless params_addressable.empty?
      url
    end
  end
end
