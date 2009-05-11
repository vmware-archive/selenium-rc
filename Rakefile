require "rubygems"
require "tmpdir"
require "open-uri"
require "fileutils"

begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = "selenium-rc"
    s.executables = "selenium-rc"
    s.summary = "The Selenium RC Server packaged as a gem."
    s.email = "pivotallabsopensource@googlegroups.com"
    s.homepage = "http://github.com/pivotal/selenium-rc"
    s.description = "The Selenium RC Server packaged as a gem"
    s.authors = ["Pivotal Labs", "Chad Woolley", "Brian Takita"]
    s.files =  FileList["[A-Z]*", "{bin,generators,lib,spec,vendor}/**/*"]
    s.extensions << 'Rakefile'
#    s.add_dependency ''
  end
rescue LoadError
  puts "Jeweler, or one of its dependencies, is not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

task :default => [:download_jar_file]

desc "Downloads and installs the SeleniumRC jar file from openqa"
task :download_jar_file do
  project_dir = File.dirname(__FILE__)
  version_data = YAML.load_file("#{project_dir}/VERSION.yml")
  jar_url = version_data[:jar_url]
  uri = URI.parse(jar_url)

  download_dir = "#{Dir.tmpdir}/#{Time.now.to_i}"
  FileUtils.mkdir_p(download_dir)
  download_path = "#{download_dir}/#{File.basename(jar_url)}"

  run = lambda do |cmd, error_msg|
    puts "Running: #{cmd}"
    system(cmd) || raise(error_msg)
  end

  run.call("wget #{jar_url} -O #{download_path}", "Downloading #{jar_url} failed")
  Dir.chdir(File.dirname(download_path)) do
    run.call("unzip #{download_path}", "Unzipping #{download_path} failed")
    run.call("cp $(find . | grep selenium-server.jar) #{project_dir}/vendor", "Copying the selenium-server.jar failed")
  end
end
