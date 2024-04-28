$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "faceauth/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "faceauth"
  s.version     = Faceauth::VERSION
  s.authors     = ["Sandeep M"]
  s.email       = ["msdp"]
  s.homepage    = "https://github.com/M-S-D-P/findface-original"
  s.summary     = %q{A rails plugin that eliminates the use of passwords to sign in replacing the medium with Human face}
  s.description = %q{A simple rails engine to implement authentication using Facial recognition system}
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  #Development Dependencies
  s.add_dependency "rails", "~> 5.0.1"
  s.add_development_dependency 'findface', '~> 0.0.1'
  s.add_development_dependency 'jpeg_camera', "~> 1.3.2"
  s.add_development_dependency 'mini_magick', "~> 4.6.1"

  #Documentation
  s.add_runtime_dependency 'yard', '~> 0.9.8'
  
end
