ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

Bundler.require(:default)
require 'erb'

ENV['RACK_ENV'] ||= 'development'

project_root = File.dirname(File.expand_path('..', __FILE__))

Dir.glob(project_root + '/app/**/*.rb', &method(:require))

require_relative "initializers/sidekiq"
require_relative "initializers/active_record"
