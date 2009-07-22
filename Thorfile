require "zip/zip"

class Joe < Thor
  alias_method :joe_build, :build
  def build
    fetch_jar
    joe_build
  end

  def fetch_jar
    url = "http://release.seleniumhq.org/selenium-remote-control/1.0.1/selenium-remote-control-1.0.1-dist.zip"
    file = File.join("tmp", File.basename(url))

    FileUtils.mkdir_p("tmp")

    system "wget #{url} -O #{file}" unless File.exist?(file)

    Zip::ZipFile.open(file) do |zipfile|
      jar_file_entry = zipfile.entries.find {|file| file.name =~ /selenium-server\.jar$/}
      destination = "vendor/selenium-server.jar"
      FileUtils.rm_rf(destination)
      zipfile.extract(jar_file_entry, destination)
    end
  end
end
