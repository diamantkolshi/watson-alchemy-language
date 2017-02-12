module AlchemyLanguage
  class TargetedEmotion < ActiveModel::Base
    add_response_field(:totalTransactions)
    add_response_field(:language)
    add_response_field(:results)

    def endpoint
      "#{@type}/#{@prefix}GetTargetedEmotion?apikey=#{@auth_token}&#{@type}=#{@path}&outputMode=json&#{params_addressable}"
    end
  end
end
