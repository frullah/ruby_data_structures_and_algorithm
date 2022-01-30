# frozen_string_literal: true

require_relative "lib/ruby_data_structures_and_algorithm/version"

Gem::Specification.new do |spec|
  spec.name = "ruby_data_structures_and_algorithm"
  spec.version = RubyDataStructuresAndAlgorithm::VERSION
  spec.authors = ["Fajarullah"]
  spec.email = ["frullah12@gmail.com"]

  spec.summary = "Ruby data structure and algorithm practice"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
