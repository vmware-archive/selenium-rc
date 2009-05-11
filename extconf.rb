dir = File.dirname(__FILE__)
Dir.chdir(dir) do
  system("rake download_jar_file") || raise("Downloading the SeleniumRC jar file failed")
end
