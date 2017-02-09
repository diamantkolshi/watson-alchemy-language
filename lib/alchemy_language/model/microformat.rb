module AlchemyLanguage
  class Microformat < ActiveModel::Base
    add_response_field(:microformats)

    def end_point
      "#{@type}/URLGetMicroformatData?apikey=#{@auth_token}&url=#{@path}&outputMode=json"
    end
  end
end
