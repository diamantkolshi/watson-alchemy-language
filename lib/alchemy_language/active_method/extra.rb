module AlchemyLanguage
  module ActiveMethod
    class Extra
      def self.add_response_field(name)
        define_method(name) do
          name = name.to_s.gsub('_', '-')
          @json_result[name.to_s]
        end
      end

      def result
        @json_result
      end
    end
  end
end
