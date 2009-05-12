# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{selenium-rc}
  s.version = "1.5.20090112"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Pivotal Labs", "Nate Clark", "Brian Takita", "Chad Woolley"]
  s.date = %q{2009-05-12}
  s.default_executable = %q{selenium-rc}
  s.description = %q{The Selenium RC Server packaged as a gem}
  s.email = %q{pivotallabsopensource@googlegroups.com}
  s.executables = ["selenium-rc"]
  s.extensions = ["Rakefile"]
  s.extra_rdoc_files = [
    "README.markdown"
  ]
  s.files = [
    "README.markdown",
    "Rakefile",
    "VERSION.yml",
    "bin/selenium-rc",
    "lib/selenium_rc.rb",
    "lib/selenium_rc/server.rb",
    "spec/install_and_run_spec.rb",
    "spec/selenium_rc/server_spec.rb",
    "spec/spec_helper.rb",
    "spec/spec_suite.rb",
    "vendor/empty.txt"
  ]
  s.homepage = %q{http://github.com/pivotal/selenium-rc}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.3}
  s.summary = %q{The Selenium RC Server packaged as a gem.}
  s.test_files = [
    "spec/install_and_run_spec.rb",
    "spec/selenium_rc/server_spec.rb",
    "spec/spec_helper.rb",
    "spec/spec_suite.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rubyzip>, [">= 0"])
    else
      s.add_dependency(%q<rubyzip>, [">= 0"])
    end
  else
    s.add_dependency(%q<rubyzip>, [">= 0"])
  end
end
