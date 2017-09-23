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

def register_user(email, password)
  uri = URI 'http://localhost:3000/signup'
  http = Net::HTTP.new uri.host, uri.port
  request = Net::HTTP::Get.new uri.path
  response = http.request request

  token = response.body.split('<meta name="csrf-token" content="')[1].split('"')[0]

  cookie = response['set-cookie'].split(';')[0]

  form_data = {
    'authenticity_token': token,
    'user[email]':  email,
    'user[password]':  password,
    'commit': 'Submit'
  }

  uri = URI 'http://localhost:3000/users'
  http = Net::HTTP.new uri.host, uri.port
  headers = {
    'Referer': 'http://localhost:3000/signup',
    'Content-Type': 'application/x-www-form-urlencoded',
    'Host': 'localhost:3000',
    'Cookie': cookie
  }
  request = Net::HTTP::Post.new uri.path, headers
  request.set_form_data form_data
  response = http.request request

  p response.body
end

def login_user
uri = URI 'http://localhost:3000/login'
http = Net::HTTP.new uri.host, uri.port
request = Net::HTTP::Get.new uri.path
response = http.request request

token = response.body.split('<meta name="csrf-token" content="')[1].split('"')[0]

cookie = response['set-cookie'].split(';')[0]
end

register_user((rand * 1_000_000).to_i.to_s, '1')
