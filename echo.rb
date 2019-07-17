# frozen_string_literal: true

require 'sinatra'

class Echo < Sinatra::Base
  get '/' do
    redirect 'https://docs.cloudwalk.io'
  end

  post '/' do
    sleep cooldown

    if params['anotherVariable']
      "CLOUDWALK #{params['buf']} #{params['anotherVariable']}"
    else
      "CLOUDWALK #{params['buf']}"
    end
  end

  helpers do
    def cooldown
      s = params['sleep'].to_f
      s > 2.0 ? 2.0 : s
    end
  end
end
