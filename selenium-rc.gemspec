# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name                = %q{selenium-rc}
  s.version             = "2.39.0"
  s.platform            = Gem::Platform::RUBY

  s.description         = %q{The Selenium Server packaged as a gem}
  s.summary             = %q{The Selenium Server packaged as a gem}
  s.authors             = ["Pivotal Labs, Inc.", "Nate Clark", "Brian Takita", "Chad Woolley", "Matthew Kocher"]
  s.email               = %q{pivotallabsopensource@googlegroups.com}
  s.homepage            = %q{http://github.com/pivotal/selenium-rc}

  s.rdoc_options        = ["--charset=UTF-8"]
  s.extra_rdoc_files    = ["README.markdown"]

  s.files               = `git ls-files`.split("\n").unshift('vendor/selenium-server.jar')
  s.executables         = %w{selenium-rc}
  s.default_executable  = %q{selenium-rc}
  s.test_files          = `git ls-files -- spec/*`.split("\n")
  s.require_paths       = %w{lib}

  s.add_dependency "selenium-client", ">= 1.2.18"
  s.add_development_dependency 'rspec', '>= 2.5.0'
  s.add_development_dependency 'rr'
  s.add_development_dependency 'thor'
  s.add_development_dependency 'lsof'
  s.add_development_dependency 'rubyzip'
  s.add_development_dependency 'gem-release'  
end
