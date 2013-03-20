require "rubygems"
require "sinatra"

get '/' do
  redirect "http://docs.cloudwalk.io"
end

post '/' do
  "CLOUDWALK " + params["buf"]
end