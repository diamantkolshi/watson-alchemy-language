module AlchemyLanguage
  module ActiveMethod
    class Extra
      def self.add_method(name)
        define_method(name) do
					@json_result[name.to_s]
        end
      end
    end
  end
end
