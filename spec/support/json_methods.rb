require 'json'

def author_api_result
  {
    "status": "OK",
    "usage": "By accessing AlchemyAPI or using information generated by AlchemyAPI, you are agreeing to be bound by the AlchemyAPI Terms of Use: http://www.alchemyapi.com/company/terms.html",
    "url": "http://techcrunch.com/2016/01/29/ibm-watson-weather-company-sale/",
    "authors": {
      "names": [
        "Author Name 1",
        "Author Name 2"
      ]
    }
  }.to_json
end

def default_api_result
  {
    "status" => "OK",
    "usage" => "By accessing AlchemyAPI or using information generated by AlchemyAPI, you are agreeing to be bound by the AlchemyAPI Terms of Use: http://www.alchemyapi.com/company/terms.html",
    "url" => "http://techcrunch.com/2016/01/29/ibm-watson-weather-company-sale/",
    "authors" => {
      "names" => [
        "Author Name 1",
        "Author Name 2"
      ]
    }
  }
end

def error_api_key
  {
    "status" => "ERROR",
    "statusInfo" => "invalid-api-key",
    "usage" => "By accessing AlchemyAPI or using information generated by AlchemyAPI, you are agreeing to be bound by the AlchemyAPI Terms of Use: http://www.alchemyapi.com/company/terms.html",
    "totalTransactions" => "1",
    "language" => "unknown"
  }
end


# apikey = da431323d51965268639e605b3c78169f710b86a
# base_url = https://gateway-a.watsonplatform.net/calls/url/URLGetAuthors
# credencial = apikey=da431323d51965268639e605b3c78169f710b86a&url=www.ibm.com&outputMode=json
