# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "ipgeobase"

def fixture(file_name)
  File.read(File.join(__dir__, "fixtures", file_name))
end

require "minitest/autorun"
require "webmock/minitest"
