module AlchemyLanguage
  class Taxonomy < ActiveModel::Base
    add_response_field(:totalTransactions)
    add_response_field(:language)
    add_response_field(:taxonomy)

    def endpoint
      url = "#{@type}/#{@prefix}GetRankedTaxonomy"
      url << "?apikey=#{@auth_token}"
      url << "&#{@type}=#{@path}&outputMode=json"
      url << "&#{params_addressable}" unless params_addressable.empty?
      url
    end
  end
end
