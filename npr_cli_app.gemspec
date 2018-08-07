

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "npr_cli_app/version"

Gem::Specification.new do |spec|
  spec.name          = "npr_cli_app"
  spec.version       = NPRCLIApp::VERSION
  spec.authors       = ["'Nicolas Marini'"]
  spec.email         = ["'nmarini44@gmail.com'"]


  spec.summary       = %q{The NPR CLI APP is available for you to use and access the most up-to-date news on NPR's website, npr.org.}
  spec.description   = %q{The app lets you view NPR's Top Story, along with a list of news categories to choose from.
  You can explore each news category, viewing each story belonging to that news category.}
  spec.homepage      = "https://github.com/nmarini/npr-cli-app.git"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"

  spec.add_dependency "nokogiri"
end
