Gem::Specification.new do |spec|
  spec.name          = "lita-mixpanel"
  spec.version       = "0.2.0"
  spec.authors       = ["Eugen Martin"]
  spec.email         = ["eugeniusmartinus@gmail.com"]
  spec.description   = "a mixpanl plugin for lita chat-bot"
  spec.summary       = "Is a handler for [Lita](https://github.com/jimmycuadra/lita) that provides current KPI information from mixpanel"
  spec.homepage      = "https://github.com/olgen/lita-mixpanel"
  spec.license       = "http://opensource.org/licenses/MIT"
  spec.metadata      = { "lita_plugin_type" => "handler" }

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "lita", ">= 4.4"
  spec.add_runtime_dependency "mixpanel_client", ">= 4.1"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rack-test"
  spec.add_development_dependency "rspec", ">= 3.0.0"
end
