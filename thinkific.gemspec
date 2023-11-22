# frozen_string_literal: true

require_relative 'lib/thinkific/version'

Gem::Specification.new do |spec|
  spec.name          = 'thinkific'
  spec.version       = Thinkific::VERSION
  spec.authors       = ['Rahul Singh']
  spec.email         = ['rahul97811@gmail.com']

  spec.summary       = 'A lightweight Ruby wrapper for the thinkific REST APIs.'
  spec.description   = "It simplifies and streamlines the process of integrating Thinkific's functionality into Ruby applications by providing a higher-level, Ruby-friendly interface for working with Thinkific's RESTful APIs."
  spec.homepage      = 'http://github.com/rahulsingh321/thinkific'
  spec.license       = 'MIT'

  spec.required_ruby_version = '>= 2.6.0'

  spec.metadata['homepage_uri']    = spec.homepage
  spec.metadata['source_code_uri'] = 'http://github.com/rahulsingh321/thinkific'
  spec.metadata['changelog_uri']   = 'https://github.com/rahulsingh321/thinkific/blob/master/CODE_OF_CONDUCT.md'

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

  # Add runtime dependencies here
  spec.add_runtime_dependency "activesupport", ">=3.0.0"
  spec.add_runtime_dependency "httparty", ">=0.10.0"

  # Add development-only dependencies here
  spec.add_development_dependency("rake", "~> 11.0")
  spec.add_development_dependency("bundler")
  spec.add_development_dependency("awesome_print")
end
