module AlchemyLanguage
  module Generators
    module Methods
    	def self.define_component(name)
      	define_method(name) do
        	eval("#{name.capitalize}").new(@path)
      	end
    	end

    	define_component :author
    end
  end
end