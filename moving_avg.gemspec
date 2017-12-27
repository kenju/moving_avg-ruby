
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "moving_avg/version"

Gem::Specification.new do |spec|
  spec.name          = "moving_avg"
  spec.version       = MovingAvg::VERSION
  spec.authors       = ["kenju"]
  spec.email         = ["ken901waga@gmail.com"]

  spec.summary       = %q{Moving Average in Ruby.}
  spec.homepage      = "https://github.com/kenju/moving_avg-ruby"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16.a"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-byebug"
end
