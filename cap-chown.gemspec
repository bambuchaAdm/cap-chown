# -*- encoding: utf-8 -*-
require File.expand_path('../lib/cap-chown/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Lukasz Dubiel"]
  gem.email         = ["bambucha14@gmail.com"]
  gem.description   = %q{Support to do chown on relase directory}
  gem.summary       = %q{Support to do chown on relase directory}
  gem.homepage      = "https://github.com/bambuchaAdm/cap-chown"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "cap-chown"
  gem.require_paths = ["lib"]
  gem.version       = Cap::Chown::VERSION
end
