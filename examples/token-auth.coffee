###
  Retrieve foursquare checkins with OAuth2 access_token
###

foursquare = require('./../lib/foursquare')

fsq = new foursquare token: 'OAuth2 access_token'

fsq.checkins 'self', limit: 5, (error, data) ->
  throw new Error error if error
  console.log data