module AlchemyLanguage
  class Microformat < ActiveModel::Base
    add_response_field(:microformats)

    def endpoint
      url = "#{@type}/#{@prefix}GetMicroformatData"
      url << "?apikey=#{@auth_token}"
      url << "&#{@type}=#{@path}&outputMode=json"
      url << "&#{params_addressable}" unless params_addressable.empty?
      url
    end
  end
end
