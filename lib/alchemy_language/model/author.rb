module AlchemyLanguage
  class Author < ActiveModel::Base
    add_response_field(:authors)

    def endpoint
      url = "#{@type}/#{@prefix}GetAuthors"
      url << "?apikey=#{@auth_token}"
      url << "&#{@type}=#{@path}&outputMode=json"
      url << "&#{params_addressable}" unless params_addressable.empty?
      url
    end
  end
end
