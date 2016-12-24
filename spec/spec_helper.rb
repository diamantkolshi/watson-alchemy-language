APP_ROOT = File.expand_path(File.join(File.dirname(__FILE__), 'lib/*.rb', '..'))
$: << File.join(APP_ROOT, 'lib/alchemy_language')

def get_file(path)
  path.split("/").last
end

require 'pry' if ENV['APP_ENV'] == 'debug' # add `binding.pry` wherever you need to debug
require 'alchemy_language'
require "alchemy_language/author.rb"

# Dir.glob(File.join("../lib", "**", "*.rb")) do |klass|
# 	require "alchemy_language/author.rb"
# end

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }
