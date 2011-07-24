Gem::Specification.new do |s|
  s.name        = 'frontend'
  s.version     = '0.0.1'
  s.summary     = 'sample frontend-module for neo4j-script extension'
  s.description = 'sample frontend-module for neo4j-script extension.'

  s.author       = 'Thomas Baum'
  s.email        = 'thomas.baum@atns.de'
  s.homepage     = 'https://github.com/tbaum/example-scriptextension'

  s.files        = ['frontend.rb']

  s.add_dependency('sinatra', '~> 1.2.6')
end
