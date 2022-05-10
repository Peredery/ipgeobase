# frozen_string_literal: true

require "happymapper"

module Ipgeobase
  class IpMetadata
    include HappyMapper

    tag "query"

    element :country, String
    element :countryCode, String
    element :city, String
    element :lat, Float
    element :lon, Float
  end
end
