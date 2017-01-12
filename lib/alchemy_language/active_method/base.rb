module AlchemyLanguage
  module ActiveMethod
    class Base
      def self.define_model(name)
        define_method(name) do
          eval("#{name.capitalize}").new(@path, @type)
        end
      end

      def self.before_request(name)
        Base.send name
      end

      def self.authenticate!
        "method authenticate"
      end
    end
  end
end
