# coding: utf-8
#lib = File.expand_path("../lib", __FILE__)
#$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
#require "lita_weather/version"

Gem::Specification.new do |spec|
  spec.name          = "lita_weather"
  spec.version       = "0.1.0"
  spec.authors       = ["Valentin Bouin"]
  spec.email         = ["valentin.bouin@fr.clara.net"]

  spec.summary       = "Add a summary"
  spec.description   = "Add description"
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"
  spec.metadata      = { "lita_plugin_type" => "handler" }

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_runtime_dependency "lita", ">= 4.7"
  spec.add_runtime_dependency "net"
  spec.add_runtime_dependency "json"

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
