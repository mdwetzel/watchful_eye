require 'net/http'
require 'sinatra'

get '/' do
  erb :home
end

post '/' do
  unless params[:url].empty?
    url = params[:url]
    unless url =~ /^http:\/\//
      url = "http://#{url}"
    end
    
    res = Net::HTTP.get_response(URI.parse(url))
  
    if res.code =~ /2|3\d{2}/
      @status = "#{url} seems to be working okay."
    else
      @status = "#{url} appears to be down!"  
    end
  end
  
  erb :home
end