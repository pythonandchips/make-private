# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "make_private/version"

Gem::Specification.new do |s|
  s.name        = "make_private"
  s.version     = MakePrivate::VERSION
  s.authors     = ["Colin Gemmell"]
  s.email       = ["pythonandchips@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Make all active record properties private}
  s.description = %q{Make all active record properties private}

  s.rubyforge_project = "make_private"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec"
  s.add_development_dependency "sqlite3-ruby"
  s.add_runtime_dependency "activerecord"
end