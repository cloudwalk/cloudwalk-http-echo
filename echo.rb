require "rubygems"
require "sinatra"

#Bound to this address so that external hosts can access it, VERY IMPORTANT!
set :bind, '0.0.0.0'

set :logging, true

get '/' do
  redirect "http://docs.cloudwalk.io"
end

post '/' do
  n = Random.rand(1...35)
  salt = rand(36**n).to_s(36) # Transform to base 27 + 9 for a-z0-9
  p salt
  if params["anotherVariable"]
    salt + "#{params["buf"]} #{params["anotherVariable"]}"
  else
    salt + "#{params["buf"]}"
  end
end
