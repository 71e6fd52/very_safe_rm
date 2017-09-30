lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'very_safe_rm/version'

Gem::Specification.new do |spec|
  spec.name          = 'very_safe_rm'
  spec.version       = VerySafeRm::VERSION
  spec.authors       = ['71e6fd52']
  spec.email         = ['DAStudio.71e6fd52@gmail.com']

  spec.summary       = 'A very safe rm'
  spec.homepage      = 'https://github.com/71e6fd52/very_safe_rm'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'rake',    '~> 10.0'
  spec.add_development_dependency 'rspec',   '~> 3.0'
end
