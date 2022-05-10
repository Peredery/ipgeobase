# frozen_string_literal: true

require_relative "ipgeobase/version"
require_relative "ipgeobase/ip_metadata"
require_relative "ipgeobase/http"

require "resolv"

module Ipgeobase
  class Error < StandardError; end

  class << self
    def lookup(ip)
      raise Error, "can't validate ip" unless validate(ip)

      response = Http.get_response(ip)
      IpMetadata.parse(response)
    end

    def validate(ip)
      ip =~ Resolv::IPv4::Regex || ip =~ Resolv::IPv6::Regex
    end
  end
end
