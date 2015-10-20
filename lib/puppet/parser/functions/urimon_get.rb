# URIMon -- The URI Digimon
# This module is of Jamaican descent
#
# Sheridan Roberts, 10/07/2015

require 'uri'
require 'net/http'

module Puppet::Parser::Functions
    newfunction(:urimon_get, :type => :rvalue) do |args|
        url = args[0]
        user = args[1]
        password = args[2]
        force_basic_auth = args[3] || true

        uri = URI.parse(url)

        http = Net::HTTP.new(uri.host, uri.port)
        request = Net::HTTP::Get.new(uri.request_uri)
        if force_basic_auth
            request.basic_auth(user, password)
        end
        response = http.request(request)

        valid_responses = ["200", "304"]
        if valid_responses.include? response.code
            return response.body
        else
            return nil
        end
    end
end
