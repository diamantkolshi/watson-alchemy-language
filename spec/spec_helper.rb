APP_ROOT = File.expand_path(File.join(File.dirname(__FILE__), 'lib/*.rb', '..'))
$: << File.join(APP_ROOT, 'lib/alchemy_language')

def get_file(path)
  path.split("/").last
end

require 'pry'
require 'alchemy_language'
require_relative '../lib/alchemy_language/model/author'


# Dir.glob(File.join("../lib", "**", "*.rb")) do |klass|
# 	require "alchemy_language/author.rb"
# end

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }
