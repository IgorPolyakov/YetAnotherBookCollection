#!/usr/bin/env ruby
# frozen_string_literal: true

require 'open-uri'
require 'nokogiri'
require 'net/http'
# request['utf8':  '%E2%9C%93'
# request['authenticity_token':  token
# request['user[email]':  login
# request['user[password]':  password
# request['commit':  'Sign+up'

def check
  page = Nokogiri::HTML(open('http://localhost:3000/'))
  if page.title == 'YetAnotherBookCollection'
    puts '101'
  else
    puts '104'
  end
end

def new_put
  uri_q = URI('http://localhost:3000/signup')
  http = Net::HTTP.new(uri_q.host, uri_q.port)
  path = '/signup'
  email = 'email'
  password = 'password'
  request = Net::HTTP::Get.new uri.path
  response = http.request request
  resp, data = http.get(path, nil)
  # response = http.request request
  token = response.body.split('<meta name="csrf-token" content="')[1].split('"')[0]
  cookie = response.get_fields('set-cookie')[1].split(';')[0]

  headers = {
    'Content-Type': 'application/x-www-form-urlencoded',
    'Cookie': cookie
  }

  aray = {
    'utf8': '✓',
    'authenticity_token':  token,
    'user[email]':  email,
    'user[password]':  password,
    'commit':  'Submit'
  }
  resp, data = http.post(path, URI.encode_www_form(aray), headers)

  puts 'Code = ' + resp.code
  puts 'Message = ' + resp.message
  resp.each { |key, val| puts key + ' = ' + val }
  puts data
end

def newnewput(email, password)
  uri = URI 'http://localhost:3000/signup'
  http = Net::HTTP.new uri.host, uri.port
  request = Net::HTTP::Get.new uri.path
  response = http.request request

  token = response.body.split('<meta name="csrf-token" content="')[1].split('"')[0]

  cookie =  cookie = response['set-cookie'].split(';')[0]

  form_data = {
    'authenticity_token': token,
    'user[email]':  email,
    'user[password]':  password,
    'commit':  'Submit'
  }

  uri = URI 'http://localhost:3000/signup'
  http = Net::HTTP.new uri.host, uri.port
  request = Net::HTTP::Post.new uri.path, 'COOKIE' => cookie
  request.set_form_data form_data
  response = http.request request

  p response.body
end
newnewput("#{(rand * 1000000_.to_i}", '1')
