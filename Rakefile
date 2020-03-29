#!/usr/bin/env rake

# TODO figure out rdoc or yard

require 'bundler/gem_tasks'
require 'rake/testtask'

Rake::TestTask.new do |t|
    t.libs << 'test'
end

desc "Run tests"
task :default => :test
