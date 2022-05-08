# frozen_string_literal: true

require_relative "ipgeobase/version"
require_relative "ipgeobase/mapper"
require_relative "ipgeobase/http"

require "resolv"

module Ipgeobase
  class Error < StandardError; end

  class << self
    def lookup(ip)
      return unless validate ip

      response = Http.get_response(ip)
      Mapper.parse(response)
    end

    def validate(ip)
      ip =~ Resolv::IPv4::Regex || ip =~ Resolv::IPv6::Regex
    end
  end
end
