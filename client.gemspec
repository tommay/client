Gem::Specification.new do |gem|
  gem.description      = "Persistent HTTP client."
  gem.summary          = "Persistent HTTP client."
  gem.authors          = ["Tom May"]
  gem.email            = ["tom@tommay.net"]
  #gem.homepage         = "https://github.com/tommay/pratt_parser"
  gem.files            = `git ls-files`.split("\n") - [".gitignore", ".travis.yml"]
  gem.test_files       = `git ls-files -- spec/*`.split("\n")
  gem.name             = "client"
  gem.require_paths    = ["lib"]
  gem.version          = "0.0.0"
  gem.license          = "MIT"
  gem.add_runtime_dependency "http", "~> 2.0"
end
