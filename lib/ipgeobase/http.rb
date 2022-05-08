# frozen_string_literal: true

require "net/http"

module Ipgeobase
  class Http
    API_URI = "http://ip-api.com/xml/%<ip>s"

    def self.get_response(ip)
      uri = URI(format(API_URI, ip: ip))

      Net::HTTP.get_response(uri).body
    end
  end
end
