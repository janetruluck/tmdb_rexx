# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'movie_rexx/version'

Gem::Specification.new do |spec|
  spec.name          = "movie_rexx"
  spec.version       = MovieRexx::VERSION
  spec.authors       = ["Jason Truluck"]
  spec.email         = ["jason.truluck@gmail.com"]

  spec.summary       = %q{Ruby wrapper for TMDB API}
  spec.description   = %q{Ruby wrapper for TMDB API}
  spec.homepage      = "https://github.com/FilmRexx/movie_rexx"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency "faraday"#, "~> 0.8.0"
  spec.add_dependency "faraday_middleware"#, "~> 0.9.0"
  spec.add_dependency "hashie"#, "~> 2.0.0"
  spec.add_dependency 'multi_json'#, "~> 1.8.0"
  spec.add_development_dependency "rspec"#, "~> 2.14.0"
  spec.add_development_dependency "json_spec"#, "~> 2.14.0"
  spec.add_development_dependency "rake"#, "~> 10.1.0"
  spec.add_development_dependency "vcr"#, "~> 1.13.0"
  spec.add_development_dependency "webmock"#, "~> 1.13.0"
  spec.add_development_dependency "pry"
end
