#!/usr/bin/env rake
require "bundler/gem_tasks"

require 'rspec/core'
require 'rspec/core/rake_task'

desc 'Default: run specs.'
task :default => :spec

RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end
