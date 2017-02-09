module AlchemyLanguage
  class Entity < ActiveModel::Base
    add_response_field(:language)
    add_response_field(:entities)

    def end_point
      "#{@type}/URLGetRankedNamedEntities?apikey=#{@auth_token}&url=#{@path}&outputMode=json"
    end
  end
end
