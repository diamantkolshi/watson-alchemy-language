module AlchemyLanguage
  class TitleExtraction < ActiveModel::Base
    add_response_field(:title)

    def endpoint
      url = "#{@type}/#{@prefix}GetTitle"
      url << "?apikey=#{@auth_token}"
      url << "&#{@type}=#{@path}&outputMode=json"
      url << "&#{params_addressable}" unless params_addressable.empty?
      url
    end
  end
end
