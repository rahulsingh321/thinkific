# frozen_string_literal: true

$LOAD_PATH.unshift(File.expand_path("../lib", __dir__))

require "thinkific"

RSpec.configure do |config|
  config.disable_monkey_patching!

  config.before do
    Thinkific::Config.reset!
  end
end
