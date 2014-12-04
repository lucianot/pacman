require 'factory_girl'
require 'timecop'

RSpec.configure do |config|
  FactoryGirl.find_definitions
  config.include FactoryGirl::Syntax::Methods
end
