require 'net/http'
require 'sinatra'

get '/' do
  res = Net::HTTP.get_response(URI.parse('http://www.google.com'))
  
  if res.code =~ /2|3\d{2}/
    @status = "Everything looks normal."
  else
    @status = "The server appears to be down!"  
  end
end