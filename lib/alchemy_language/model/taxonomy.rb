module AlchemyLanguage
  class Taxonomy < ActiveModel::Base
    add_response_field(:totalTransactions)
    add_response_field(:language)
    add_response_field(:taxonomy)

    def endpoint
      "#{@type}/URLGetRankedTaxonomy?apikey=#{@auth_token}&url=#{@path}&outputMode=json"
    end
  end
end