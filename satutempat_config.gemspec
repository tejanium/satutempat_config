Gem::Specification.new do |s|
  s.name        = 'satutempat_config'
  s.version     = '0.0.1'
  s.date        = Date.parse '17 April 2013'
  s.summary     = 'SatuTempat Configuration'
  s.description = 'Gem to store all the SatuTempat Websites configuration'
  s.authors     = ['Teja Sophista']
  s.email       = ['teja@domikado.com']
  s.files       = `git ls-files`.split($/)

  s.add_development_dependency 'rspec'

  s.add_runtime_dependency 'mongoid', '2.4.7'
end
