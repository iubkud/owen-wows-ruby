# frozen_string_literal: true

require_relative "lib/owen_wows/version"

Gem::Specification.new do |spec|
  spec.name          = "owen_wows"
  spec.version       = OwenWows::VERSION
  spec.authors       = ["Matt Barry"]
  spec.email         = ["mbarry@gmail.com"]

  spec.summary       = "Ruby bindings for the Owen Wilson Wow API."
  spec.description   = "Search and view every time Owen Wilson said \"Wow\" in a movie." \
                       "See https://owen-wilson-wow-api.herokuapp.com/ for the API."
  spec.homepage      = "https://github.com/iubkud/owen-wows-ruby"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 3.0.1")

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/iubkud/owen-wow-api-ruby"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
  spec.add_dependency "faraday", "2.2.0"
  spec.add_dependency "hashie", "5.0.0"
end
