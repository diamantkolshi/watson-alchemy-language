module AlchemyLanguage
  class FeedDetection < ActiveModel::Base
    add_response_field(:feeds)

    def end_point
      "#{@type}/URLGetFeedLinks?apikey=#{@auth_token}&url=#{@path}&outputMode=json"
    end
  end
end
