###
  node-4sq 0.1.0
  (c) 2012 Alexey Simonenko, Serenity LLC.
###

# Constructor
xhr = require 'request'
qs  = require 'querystring'

class Foursquare
  apihost = 'https://api.foursquare.com'
  version = 'v2'

  constructor: (@options = {}) ->
    date = new Date()
    month = date.getMonth() + 1

    options.date = date.getFullYear()
    options.date += (if month < 10 then '0' else '') + month
    options.date += (if date.getDate() < 10 then '0' else '') + date.getDate()

  user: (userid, params, fn) ->
    userid = 'self' if not userid or parseInt(userid, 10) <= 0

    if isFunction params
      fn = params
      params = {}

    @scheme = "/users/#{userid}"
    request @, params, fn

  checkins: (userid, params, fn) ->
    userid = 'self' if not userid or parseInt(userid, 10) <= 0

    if isFunction params
      fn = params
      params = {}

    @scheme = "/users/#{userid}/checkins"
    request @, params, fn

  badges: (userid, params, fn) ->
    userid = 'self' if not userid or parseInt(userid, 10) <= 0

    if isFunction params
      fn = params
      params = {}

    @scheme = "/users/#{userid}/badges"
    request @, params, fn

  request = (self, query = {}, fn = ->) ->
    query.v = self.options.date
    query = qs.stringify query

    params = url: "#{apihost}/#{version}#{self.scheme}?oauth_token=#{self.options.token}&#{query}"

    xhr params, (error, request, body) ->
      body  = JSON.parse body
      error = body.meta if body.meta.code isnt 200
      data  = if body.response? then body.response else null

      fn.call self, error, data

  isFunction = (object) -> '[object Function]' is toString.call object

module.exports = Foursquare