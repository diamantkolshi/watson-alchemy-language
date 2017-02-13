module AlchemyLanguage
  class RawText < ActiveModel::Base
    add_response_field(:text)

    def endpoint
      url = "#{@type}/#{@prefix}GetRawText"
      url << "?apikey=#{@auth_token}"
      url << "&#{@type}=#{@path}&outputMode=json"
      url << "&#{params_addressable}" unless params_addressable.empty?
      url
    end
  end
end
