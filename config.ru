# require 'rubygems'
# require 'bundler'
# Bundler.require(:default)
# require 'sass/plugin/rack'
require "./app/app"

# use scss for stylesheets
# Sass::Plugin.options[:style] = :compressed
# use Sass::Plugin::Rack

run Sinatra::Application
