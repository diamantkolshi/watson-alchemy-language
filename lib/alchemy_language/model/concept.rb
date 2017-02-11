module AlchemyLanguage
  class Concept < ActiveModel::Base
    add_response_field(:concepts)

    def endpoint
      "#{@type}/URLGetRankedConcepts?apikey=#{@auth_token}&url=#{@path}&outputMode=json"
    end
  end
end
