require "bundler/gem_tasks"
require 'bundler/setup'
require 'rspec/core/rake_task'

# Default directory to look in is `/specs`
# Run with `rake spec`
RSpec::Core::RakeTask.new(:spec) do |task|
  task.rspec_opts = ['--color', '--format documentation']
end

task :default => :spec
#
# PACKAGE_NAME = "datahunter"
# VERSION = Datahunter::VERSION
# TRAVELING_RUBY_VERSION = "20150210-2.1.5"
#
# desc "Package your app"
# task :package => ['package:linux:x86', 'package:linux:x86_64', 'package:osx']
#
# namespace :package do
#   namespace :linux do
#     desc "Package Hunter for Linux x86"
#     task :x86 => [:bundle_install, "packaging/traveling-ruby-#{TRAVELING_RUBY_VERSION}-linux-x86.tar.gz"] do
#       create_package("linux-x86")
#     end
#
#     desc "Package Hunter for Linux x86_64"
#     task :x86_64 => [:bundle_install, "packaging/traveling-ruby-#{TRAVELING_RUBY_VERSION}-linux-x86_64.tar.gz"] do
#       create_package("linux-x86_64")
#     end
#   end
#
#   desc "Package your app for OS X"
#   task :osx => [:bundle_install, "packaging/traveling-ruby-#{TRAVELING_RUBY_VERSION}-osx.tar.gz"] do
#     create_package("osx")
#   end
#
#   desc "Install gems to local directory"
#   task :bundle_install do
#     if RUBY_VERSION !~ /^2\.1\./
#       abort "Only ruby 2.1"
#     end
#     sh "rm -rf packaging/tmp"
#     sh "mkdir -p packaging/tmp"
#     sh "cp datahunter.gemspec Gemfile.lock packaging/tmp/"
#     Bundler.with_clean_env do
#       sh "cd packaging/tmp && env BUNDLE_IGNORE_CONFIG=1 bundle install --path packaging/vendor"
#     end
#     sh "rm -rf packaging/tmp"
# #    sh "rm -f packaging/vendor/*/*/cache/*"
#   end
# end
#
# file "packaging/traveling-ruby-#{TRAVELING_RUBY_VERSION}-linux-x86.tar.gz" do
#   download_runtime("linux-x86")
# end
#
# file "packaging/traveling-ruby-#{TRAVELING_RUBY_VERSION}-linux-x86_64.tar.gz" do
#   download_runtime("linux-x86_64")
# end
#
# file "packaging/traveling-ruby-#{TRAVELING_RUBY_VERSION}-osx.tar.gz" do
#   download_runtime("osx")
# end
#
# def create_package(target)
#   package_dir = "#{PACKAGE_NAME}-#{VERSION}-#{target}"
#   sh "rm -rf #{package_dir}"
#   sh "mkdir #{package_dir}"
#   sh "mkdir -p #{package_dir}/lib/app"
#   sh "cp bin/hunter bin/datahunter #{package_dir}/lib/app"
#   sh "mkdir #{package_dir}/lib/ruby"
#   sh "tar -xzf packaging/traveling-ruby-#{TRAVELING_RUBY_VERSION}-#{target}.tar.gz -C #{package_dir}/lib/ruby"
#   sh "cp packaging/wrapper.sh #{package_dir}/hunter"
#   sh "cp -pR packaging/vendor #{package_dir}/lib/"
#   sh "cp datahunter.gemspec Gemfile.lock #{package_dir}/lib/vendor/"
#   sh "mkdir #{package_dir}/lib/vendor/.bundle"
# #  sh "cp packaging/bundler-config #{package_dir}/lib/vendor/.bundle/config"
#   if !ENV['DIR_ONLY']
#     sh "tar -czf #{package_dir}.tar.gz #{package_dir}"
#     sh "rm -rf #{package_dir}"
#   end
# end
#
# def download_runtime(target)
#   sh "cd packaging && curl -L -O --fail " +
#     "http://d6r77u77i8pq3.cloudfront.net/releases/traveling-ruby-#{TRAVELING_RUBY_VERSION}-#{target}.tar.gz"
# end