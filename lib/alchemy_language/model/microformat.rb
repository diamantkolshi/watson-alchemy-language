module AlchemyLanguage
  class Microformat < ActiveModel::Base
    add_response_field(:microformats)

    def endpoint
      "#{@type}/URLGetMicroformatData?apikey=#{@auth_token}&url=#{@path}&outputMode=json"
    end
  end
end
