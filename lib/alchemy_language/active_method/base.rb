module AlchemyLanguage
  module ActiveMethod
    class Base
      def self.define_component(name)
        define_method(name) do
          eval("#{name.capitalize}").new(@path, @type)
        end
      end
    end
  end
end
