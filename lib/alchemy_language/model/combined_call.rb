module AlchemyLanguage
  class CombinedCall < ActiveModel::Base
    add_response_field(:totalTransactions)
    add_response_field(:language)

    def initialize(path, type, options={})
      super 
      check_options
    end

    def endpoint
      url = "#{@type}/#{@prefix}GetCombinedData"
      url << "?apikey=#{@auth_token}"
      url << "&#{@type}=#{@path}&outputMode=json"
      url << "&#{params_addressable}" unless params_addressable.empty?
      url
    end

    def check_options
      if @options.key?(:extract)
        @options[:extract].split(',').each do |option|
          add_dynamic_response_field(option)
        end
      end
    end

    def add_dynamic_response_field(name)
      self.class.send(:define_method, name) do 
        name = name.to_s.gsub('_', '-')
        @json_result[name.to_s]
      end
    end
  end
end
