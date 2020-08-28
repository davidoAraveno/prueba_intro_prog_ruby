require 'uri'
require 'net/http'
require 'openssl'
require 'json'

def request(url,api_key)
    url_api = URI(url+api_key)
    http = Net::HTTP.new(url_api.host,url_api.port)
    request = Net::HTTP::Get.new(url_api)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    response = http.request(request)

    unless response.code.to_i >= 200 && response.code.to_i <= 299
        return nil
    else
        return JSON.parse(response.read_body)
    end 
end