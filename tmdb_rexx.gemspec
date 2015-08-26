# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tmdb_rexx/version'

Gem::Specification.new do |spec|
  spec.name          = "tmdb_rexx"
  spec.version       = TmdbRexx::VERSION
  spec.authors       = ["Jason Truluck"]
  spec.email         = ["jason.truluck@gmail.com"]

  spec.summary       = %q{Ruby wrapper for TMDB API}
  spec.description   = %q{Ruby wrapper for TMDB API}
  spec.homepage      = "https://github.com/FilmRexx/tmdb_rexx"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_dependency "faraday", "~> 0.9"
  spec.add_dependency "faraday_middleware", "~> 0.10"
  spec.add_dependency "hashie", "~> 3.4"
  spec.add_dependency 'multi_json', "~> 1.11"
  spec.add_development_dependency "rspec", "~> 3.3"
  spec.add_development_dependency "json_spec", "~> 1.1"
  spec.add_development_dependency "rake", "~> 10"
  spec.add_development_dependency "vcr", "~> 2.9"
  spec.add_development_dependency "webmock", "~> 1.21"
  spec.add_development_dependency "pry", "~> 0.10"
  spec.add_development_dependency "codeclimate-test-reporter", "~> 0.4"
end
