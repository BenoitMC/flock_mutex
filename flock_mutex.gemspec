Gem::Specification.new do |spec|
  spec.name          = "flock_mutex"
  spec.version       = "1.0"
  spec.authors       = ["Benoit MARTIN-CHAVE"]
  spec.email         = ["benoitmartinchave@gmail.com"]
  spec.summary       = %q{A very simple ruby mutex class using file lock.}
  spec.homepage      = "http://github.com/BenoitMC/flock_mutex"
  spec.license       = "WTFPL"
  spec.files         = `git ls-files -z`.split("\x0")
end
