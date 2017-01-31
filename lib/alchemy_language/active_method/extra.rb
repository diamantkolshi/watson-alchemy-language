module AlchemyLanguage
  module ActiveMethod
    class Extra
      def self.add_method(name)
        define_method(name) do
          @json_result[name.to_s]
        end
      end

      def result
        @json_result.to_json
      end
    end
  end
end
