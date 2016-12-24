Dir.glob(File.join("alchemy_language", "**", "*.rb")).each do |klass|
  require_relative klass
end
require 'uri'
require 'rest-client'

module AlchemyLanguage
end
