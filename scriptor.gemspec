require_relative "lib/scriptor/version"

Gem::Specification.new do |spec|
  spec.name = "scriptor"
  spec.version = Scriptor::VERSION
  spec.authors = ["hatsu38"]
  spec.email = ["hajiwata0308@gmail.com"]

  spec.summary = "A Rails Engine to execute and manage scripts directly from your browser."
  spec.description = <<~DESC
    Scriptor is a Rails Engine that allows you to manage and execute Ruby scripts
    located in the `script` folder directly from a web interface. This gem is 
    designed for developers who want an intuitive way to trigger and monitor 
    scripts without needing to access the command line.
    
    Key Features:
    - Run Ruby scripts with dynamic arguments via a browser-based UI.
    - Preview script execution commands before running them.
    - Capture and display script output in real-time.
    - Simple integration into existing Rails applications.
  DESC
  spec.homepage = "https://github.com/hatsu38/scriptor"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "https://rubygems.org"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/hatsu38/scriptor"
  spec.metadata["changelog_uri"] = "https://github.com/hatsu38/scriptor/CHANGELOG.md"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 8.0.0"
end
