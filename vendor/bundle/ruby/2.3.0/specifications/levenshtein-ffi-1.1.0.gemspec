# -*- encoding: utf-8 -*-
# stub: levenshtein-ffi 1.1.0 ruby lib
# stub: ext/levenshtein/extconf.rb

Gem::Specification.new do |s|
  s.name = "levenshtein-ffi"
  s.version = "1.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["David Balatero"]
  s.date = "2014-08-11"
  s.description = "Provides a fast, cross-Ruby implementation of the levenshtein distance algorithm."
  s.email = "dbalatero@gmail.com"
  s.extensions = ["ext/levenshtein/extconf.rb"]
  s.extra_rdoc_files = ["README.markdown"]
  s.files = ["README.markdown", "ext/levenshtein/extconf.rb"]
  s.homepage = "http://github.com/dbalatero/levenshtein-ffi"
  s.licenses = ["BSD 2-Clause"]
  s.rubygems_version = "2.5.1"
  s.summary = "An FFI version of the levenshtein gem."

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<ffi>, ["~> 1.9"])
      s.add_development_dependency(%q<rspec>, ["~> 2.99"])
      s.add_development_dependency(%q<jeweler>, ["~> 2.0"])
    else
      s.add_dependency(%q<ffi>, ["~> 1.9"])
      s.add_dependency(%q<rspec>, ["~> 2.99"])
      s.add_dependency(%q<jeweler>, ["~> 2.0"])
    end
  else
    s.add_dependency(%q<ffi>, ["~> 1.9"])
    s.add_dependency(%q<rspec>, ["~> 2.99"])
    s.add_dependency(%q<jeweler>, ["~> 2.0"])
  end
end
