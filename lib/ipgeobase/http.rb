# frozen_string_literal: true

require "net/http"
require "addressable/template"

module Ipgeobase
  class Http
    API_URL = "http://ip-api.com/xml/{ip}"

    def self.get_response(ip)
      http_address = Addressable::Template.new(API_URL).expand({ ip: ip })

      Net::HTTP.get_response(http_address).body
    end
  end
end
