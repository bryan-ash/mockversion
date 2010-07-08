require 'rake'

Gem::Specification.new do |s|
  s.name = 'mockversion'
  s.version = '0.0.2'

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ['Bryan Ash']
  s.description = %q{A mock for the svn commandline to help tool development}
  s.email = %q{}
  s.require_paths = ["lib"]
  s.extra_rdoc_files = [ "LICENSE", "README.markdown" ]
  s.files = FileList['lib/**/*', 'bin/*', '[A-Z].*', 'feature/**/*', 'spec/**/*'].to_a
  s.rdoc_options = ["--charset=UTF-8"]
  s.summary = %q{Taking the pain out of svn tool development}
end
