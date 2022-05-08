# frozen_string_literal: true

require "test_helper"

class TestIpgeobase < Minitest::Test
  def before_setup
    stub_request(:get, "http://ip-api.com/xml/8.8.8.8").to_return(status: 200, body: fixture("ip_api.xml"))
  end

  def test_ipgeobase_lookup
    ip_info = Ipgeobase.lookup("8.8.8.8")

    assert_equal "US", ip_info.countryCode
    assert_equal "United States", ip_info.country
    assert_equal "Ashburn", ip_info.city
    assert_equal 39.03, ip_info.lat
    assert_equal(-77.5, ip_info.lon)
  end
end
