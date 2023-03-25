# frozen_string_literal: true

require "openai_image_generator"
require 'webmock/rspec'
require 'faker'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

def mock_api_key
  Faker::Crypto.md5
end

def request_headers
  {
    "Authorization" => "Bearer #{mock_api_key}",
    "Content-Type" => "application/json",
  }
end