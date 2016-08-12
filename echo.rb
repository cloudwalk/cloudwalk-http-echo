require 'sinatra'

get '/' do
  redirect "https://docs.cloudwalk.io"
end

post '/' do
  if params["anotherVariable"]
    "CLOUDWALK #{params["buf"]} #{params["anotherVariable"]}"
  else
    "CLOUDWALK #{params["buf"]}"
  end
end
