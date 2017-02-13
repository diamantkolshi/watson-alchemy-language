module AlchemyLanguage
  class FeedDetection < ActiveModel::Base
    add_response_field(:feeds)

    def endpoint
      url = "#{@type}/#{@prefix}GetFeedLinks"
      url << "?apikey=#{@auth_token}"
      url << "&#{@type}=#{@path}&outputMode=json"
      url << "&#{params_addressable}" unless params_addressable.empty?
      url
    end
  end
end
