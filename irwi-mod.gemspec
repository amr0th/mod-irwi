require File.expand_path("../lib/irwi_mod/version", __FILE__)

Gem::Specification.new do |s|
  s.name = "irwi_mod"
  s.version = IrwiMod::VERSION::STRING
  s.platform = Gem::Platform::RUBY
  s.authors = ["Ricardo Henriques"]
  s.email = ["ricardo.n.henriques@gmail.com"]
  s.homepage = "http://github.com/amr0th/mod-irwi"
  s.summary = "Adds wiki functionality to your application. Based on http://github.com/alno/irwi"
  s.licenses = ['MIT', 'GPL-2']
  s.description = "Adds wiki functionality. Based on http://github.com/alno/irwi."

  s.required_rubygems_version = ">= 1.3.6"

  # Gem dependencies
  s.add_dependency "diff-lcs", ">= 1.1.2"

  s.add_dependency "activerecord", ">= 3.0.0"
  s.add_dependency "activesupport", ">= 3.0.0"
  s.add_dependency "actionpack", ">= 3.0.0"
  s.add_dependency "RedCloth", ">= 4.2.9"
  s.add_dependency "rails_autolink", ">= 1.0" # TODO should be optional

  # Development dependencies
  s.add_development_dependency "rspec", ">=2.0"
  s.add_development_dependency "sqlite3"

  # Gem files
  s.files = Dir["app/views/**/*.erb", "lib/**/*.rb", "bin/*", "MIT-LICENSE", "README.rdoc"]
  s.extra_rdoc_files = [ "README.rdoc", "MIT-LICENSE"]
  s.require_path = 'lib'

  # Info
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "IrwiMod", "--main", "README.rdoc"]

end
