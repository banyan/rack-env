# -*- encoding: utf-8 -*-
require File.expand_path('../lib/rack/env/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Kohei Hasegawa"]
  gem.email         = ["ameutau@gmail.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = "http://github.com/banyan/rack-env"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "rack-env"
  gem.require_paths = ["lib"]
  gem.version       = Rack::Env::VERSION

  gem.add_development_dependency "rspec",     "~> 2.11.0"
  gem.add_development_dependency 'rake',      '>= 0.9.2.2'
  gem.add_development_dependency "rack",      '>= 1.4.1'
  gem.add_development_dependency 'rack-test', '>= 0.6.1'
end
