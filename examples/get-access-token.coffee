express   = require 'express'
everyauth = require 'everyauth'

everyauth.debug = true;

options =
  host:   'http://localhost:3000' # change this
  id:     '-- client id --'       # change this
  secret: '-- client secret --'   # change this

current = token = null

everyauth.foursquare.myHostname   options.host
everyauth.foursquare.redirectPath '/'
everyauth.foursquare.appId        options.id
everyauth.foursquare.appSecret    options.secret
everyauth.foursquare.findOrCreateUser (session, accessToken, accessTokenExtra, user) ->
  [token, current] = [accessToken, user]

app = express.createServer()

app.use express.bodyParser()
app.use express.cookieParser()
app.use express.session secret: 'node-4sq'
app.use everyauth.middleware()

app.set 'views', __dirname + '/views'
app.set 'view engine', 'ejs'
app.set 'view options', layout: false

app.get '/', (request, response) ->
  if not request.loggedIn
    response.render 'login'
  else
    response.render 'result'
      id:    current.id
      name:  current.firstName + ' ' + current.lastName
      token: token

everyauth.helpExpress app

app.listen 3000
console.log 'Go to ' + options.host