require "rubygems"
require "sinatra"

#Bound to this address so that external hosts can access it, VERY IMPORTANT!
set :bind, '0.0.0.0'

set :logging, true

get '/' do
  redirect "http://docs.cloudwalk.io"
end

post '/' do
  if params["anotherVariable"]
    "CLOUDWALK #{params["buf"]} #{params["anotherVariable"]}"
  else
    "CLOUDWALK #{params["buf"]}"
  end
end
