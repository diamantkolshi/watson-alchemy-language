module AlchemyLanguage
  class Text < ActiveModel::Base
    add_response_field(:language)
    add_response_field(:text)

    def endpoint
      url = "#{@type}/#{@prefix}GetText"
      url << "?apikey=#{@auth_token}"
      url << "&#{@type}=#{@path}&outputMode=json"
      url << "&#{params_addressable}" unless params_addressable.empty?
      url
    end
  end
end
