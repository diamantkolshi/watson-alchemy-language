module AlchemyLanguage
  class Author < ActiveModel::Base
    add_response_field(:authors)

    def endpoint
      "#{@type}/URLGetAuthors?apikey=#{@auth_token}&url=#{@path}&outputMode=json"
    end
  end
end
