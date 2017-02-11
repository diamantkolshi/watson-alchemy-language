Gem::Specification.new do |s|
  s.name          = 'alchemy_language'
  s.version       = '1.0.2'
  s.date          = '2017-02-10'
  s.summary       = "Alchemy Language!"
  s.description   = "AlchemyLanguage is a collection of APIs that offer text analysis through natural language processing."
  s.authors       = ["Diamant Kolshi"]
  s.email         = 'diamantkolshi@gmail.com'
  s.files         =  Dir.glob("lib/**/*") + %w(README.md)
  s.homepage      = 'https://github.com/diamantkolshi/alchemy_language'
  s.license       = 'MIT'
  s.require_path  = 'lib'
  s.executables = `git ls-files -- bin/*`.split('\n').map{ |f| File.basename(f) }
end 