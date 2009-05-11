require "rubygems"
require "tmpdir"
require "fileutils"
require "open-uri"
require "zip/zip"

# TODO: Disable all rake version:* tasks because they clobber VERSION.yml
begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = "selenium-rc"
    s.executables = "selenium-rc"
    s.summary = "The Selenium RC Server packaged as a gem."
    s.email = "pivotallabsopensource@googlegroups.com"
    s.homepage = "http://github.com/pivotal/selenium-rc"
    s.description = "The Selenium RC Server packaged as a gem"
    s.authors = ["Pivotal Labs", "Nate Clark", "Brian Takita", "Chad Woolley"]
    s.files =  FileList["[A-Z]*", "{bin,generators,lib,spec,vendor}/**/*"]
    s.extensions << 'Rakefile'
    s.add_dependency "rubyzip"
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

  jar_uri = URI.parse(jar_url)
  File.open(download_path, 'wb') do |f|
    f.write(jar_uri.open.read)
  end
  Zip::ZipFile.open(download_path) do |zipfile|
    jar_file_entry = zipfile.entries.find {|file| file.name =~ /selenium-server\.jar$/}
    zipfile.extract(jar_file_entry, "#{project_dir}/vendor/selenium-server.jar")
  end
end
