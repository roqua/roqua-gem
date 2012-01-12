$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rspec'
require 'vcr'
require 'roqua-gem'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

VCR.configure do |config|
  config.cassette_library_dir = "spec/cassettes"
  config.hook_into :fakeweb
end

RSpec.configure do |config|
  config.extend VCR::RSpec::Macros
end
