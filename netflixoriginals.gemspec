
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "netflixoriginals/version"

Gem::Specification.new do |spec|
  spec.name          = "netflixoriginals"
  spec.version       = Netflixoriginals::VERSION
  spec.authors       = ["'Nicholas Ng'"]
  spec.email         = ["'nicholasykng@gmail.com'"]

  spec.summary       = "The Best Netflix Original Series Right Now, Ranked"
  spec.description   = "It lists 55 Best Netflix Original Series Right Now as of November 4, 2019"
  spec.homepage      = "https://github.com/nicholasykng/netflixoriginals"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  
  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "nokogiri"
end
