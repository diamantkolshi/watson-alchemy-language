module AlchemyLanguage
  class Concept < ActiveModel::Base
    add_method(:concepts)

    def end_point
      "#{@type}/URLGetRankedConcepts?apikey=#{@auth_token}&url=#{@path}&outputMode=json"
    end
  end
end
