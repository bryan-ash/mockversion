module MockVersion
  APP_PATH = File.expand_path(File.dirname(__FILE__) + '/../../bin/')
  VERSION = "0.0.3"

  ENV['PATH'] = MockVersion::APP_PATH + File::PATH_SEPARATOR + ENV['PATH']
end

