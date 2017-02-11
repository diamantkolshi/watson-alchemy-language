module AlchemyLanguage
  class RawText < ActiveModel::Base
    add_response_field(:text)

    def endpoint
      "#{@type}/URLGetRawText?apikey=#{@auth_token}&url=#{@path}&outputMode=json"
    end
  end
end
