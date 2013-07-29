require "rubygems"
require "sinatra"

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