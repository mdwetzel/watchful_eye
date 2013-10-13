require 'net/http'
require 'sinatra'

get '/' do
  erb :home
end

post '/' do
  unless params[:url].empty?
    url = params[:url]
    
    if up? url
      @status = "<span class='up'>It's up!</span>"
    else 
      @status = "<span class='down'>It's down!</span>"   
    end
  end
  
  erb :home
end

def up?(url)
  unless url =~ /^http:\/\//
    url = "http://#{url}"
  end
  
  res = Net::HTTP.get_response(URI.parse(url))

  if res.code =~ /2|3\d{2}/
    true
  else
    false
  end
end