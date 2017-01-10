module AlchemyLanguage
  module ActiveMethod
    class Extra
      def self.add_method(name)
        define_method(name) do
          block_given? ? yield : "no block given"
        end
      end
    end
  end
end
