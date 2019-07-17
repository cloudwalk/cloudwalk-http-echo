# frozen_string_literal: true

ENV['RACK_ENV'] = 'test'

require 'coveralls'
Coveralls.wear!

require 'simplecov'
SimpleCov.formatter = SimpleCov::Formatter::HTMLFormatter
SimpleCov.start

require 'minitest/autorun'
require 'rack/test'
require 'mocha/minitest'
require 'tilt/erb'
require_relative 'echo.rb'

include Rack::Test::Methods

def app
  Echo
end

describe Echo do
  it 'should redirect to the docs' do
    get '/'
    assert last_response.redirect?
  end

  it 'should echo' do
    post '/'
    assert last_response.ok?
    assert last_response.body.include?('CLOUDWALK'), 'Echo failed'
  end

  it 'should echo with sleep' do
    post '/?sleep=0.3'
    assert last_response.ok?
    assert last_response.body.include?('CLOUDWALK'), 'Echo failed'
  end

  it 'should echo with a buffer' do
    post '/?buf=TEST'
    assert last_response.ok?
    assert last_response.body.include?('CLOUDWALK TEST'), 'Echo failed'
  end

  it 'should echo with a buffer and another variable' do
    post '/?buf=TEST&anotherVariable=FOO'
    assert last_response.ok?
    assert last_response.body.include?('CLOUDWALK TEST FOO'), 'Echo failed'
  end
end
