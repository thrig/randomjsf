require File.expand_path('../lib/randomjsf/version', __FILE__)

Gem::Specification.new do |gem|
    gem.name = 'randomjsf'
    gem.version = RandomJsf::VERSION
    gem.files = %w[ext/randomjsf/extconf.rb ext/randomjsf/randomjsf.c lib/randomjsf.rb lib/randomjsf/version.rb]
    gem.extensions = %w[ext/randomjsf/extconf.rb]
    gem.description = 'JSF RNG'
    gem.summary = 'Jenkins Small Fast (JSF) RNG'
    gem.licenses = ['BSD-3-Clause']
    gem.authors = ['Jeremy Mates']
    gem.email = ['jeremy.mates@gmail.com']
    gem.homepage = 'https://github.com/thrig/randomjsf'
end
