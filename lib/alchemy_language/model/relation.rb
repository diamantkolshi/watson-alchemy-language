module AlchemyLanguage
  class Relation < ActiveModel::Base
    add_response_field(:language)
    add_response_field(:relations)

    def endpoint
      "#{@type}/URLGetRelations?apikey=#{@auth_token}&url=#{@path}&outputMode=json"
    end
  end
end
