require "rake/clean"

task :default => :gem

task :gem do
  sh "gem build client.gemspec"
end
CLEAN.include "*.gem"

task :install => :gem do
  sh "gem install client"
end
