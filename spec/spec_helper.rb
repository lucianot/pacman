require 'factory_girl'
require 'timecop'
require 'rack/test'

require File.expand_path '../../app/app.rb', __FILE__

ENV['RACK_ENV'] = 'test'

module RSpecMixin
  include Rack::Test::Methods
  def app() Sinatra::Application end
end

RSpec.configure do |config|
  FactoryGirl.find_definitions
  config.include FactoryGirl::Syntax::Methods
  config.include RSpecMixin
end
