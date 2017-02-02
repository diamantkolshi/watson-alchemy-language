module AlchemyLanguage
  class Author < ActiveModel::Base
    add_method(:authors)

    def end_point
      "#{@type}/URLGetAuthors?apikey=#{@auth_token}&url=#{@path}&outputMode=json"
    end
  end
end
