# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "phone_number/version"

Gem::Specification.new do |s|
  s.name        = "phone_number"
  s.version     = PhoneNumber::VERSION
  s.authors     = ["Jeff Wigal"]
  s.email       = ["jeff@assignr.com"]
  s.homepage    = 'http://github.com/jwigal/phone_number'
  s.summary     = "I18n aware phone number parser"
  s.description = "A gem to parse phone numbers into an appropriate I18n format"
  
  s.rubyforge_project = "phone_number"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  s.add_development_dependency "rake"
  s.add_development_dependency "shoulda-context"
  s.add_dependency "i18n", ">=0.5.0"
end
