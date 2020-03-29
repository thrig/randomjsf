Gem::Specification.new do |gem|
    gem.name = 'randomjsf'
    gem.version = '0.0.1'
    gem.files = %w[ext/randomjsf/extconf.rb ext/randomjsf/randomjsf.c lib/randomjsf.rb]
    gem.extensions = %w[ext/randomjsf/extconf.rb]
    gem.description = 'JSF RNG'
    gem.summary = 'Jenkins Small Fast (JSF) RNG'
    gem.date = '2020-03-28'
    gem.licenses = ['BSD-3-Clause']
    gem.authors = ['Jeremy Mates']
    gem.email = ['jeremy.mates@gmail.com']
    gem.homepage = 'https://github.com/thrig/randomjsf'
end
