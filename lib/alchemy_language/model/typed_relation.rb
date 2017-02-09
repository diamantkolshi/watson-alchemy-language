module AlchemyLanguage
  class TypedRelation < ActiveModel::Base
    add_response_field(:totalTransactions)
    add_response_field(:language)
    add_response_field(:typedRelations)

    def endpoint
      "#{@type}/URLGetTypedRelations?apikey=#{@auth_token}&url=#{@path}&outputMode=json"
    end
  end
end
