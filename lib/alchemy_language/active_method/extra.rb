module AlchemyLanguage
  module ActiveMethod
    class Extra
      def self.add_method(name)
        define_method(name) do
					@json_res[name.to_s]
        end
      end
    end
  end
end
