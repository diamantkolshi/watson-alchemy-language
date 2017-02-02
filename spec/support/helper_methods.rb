require 'json'

def json_response(file_name, options = {json_parse: false})
  fetch_json = File.open(File.dirname(__FILE__) + '/fixtures/' + file_name, 'rb').read
  if options[:json_parse  ] == true
    JSON.parse(fetch_json)
  else
    fetch_json
  end
end
