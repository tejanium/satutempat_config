Gem::Specification.new do |s|
  s.name        = 'satutempat_config'
  s.version     = '0.0.2'
  s.summary     = 'SatuTempat Configuration'
  s.description = 'Gem to store all the SatuTempat Websites configuration'
  s.authors     = ['Teja Sophista']
  s.email       = ['teja@domikado.com']

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'debugger'

  s.add_runtime_dependency 'mongoid', '2.4.7'
  s.add_runtime_dependency 'bson_ext'
end
