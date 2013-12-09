# 4sq

[![NPM version](https://badge.fury.io/js/4sq.png)](http://badge.fury.io/js/4sq) [![Dependency Status](https://david-dm.org/meritt/node-4sq.png)](https://david-dm.org/meritt/node-4sq)

A Node.JS wrapper for the [Foursquare API](https://developer.foursquare.com/overview/).

## Installation

```
$ npm install 4sq
```

## Examples

```js
var foursquare = require('4sq');

var fsq = new foursquare({token: 'OAuth2 access_token'});

fsq.checkins('self', {limit: 5}, function(error, data) {
  if (error) {
    throw new Error(error);
  }

  console.log(data);
});
```

```coffeescript
foursquare = require '4sq'

fsq = new foursquare token: 'OAuth2 access_token'

fsq.checkins 'self', limit: 5, (error, data) ->
  throw new Error error if error
  console.log data
```

## How to retrieve foursquare OAuth2 access_token

Grab latest source code and install all dev dependencies

```
$ npm link
```

Change your host, client id, client secret in [examples/get-access-token.coffee](http://github.com/meritt/node-4sq/blob/master/examples/get-access-token.coffee) and after that run [examples/get-access-token.coffee](http://github.com/meritt/node-4sq/blob/master/examples/get-access-token.coffee)

```
$ coffee examples/get-access-token.coffee
```

## API

* user (user_id, params, callback)
* checkins (user_id, params, callback)
* badges (user_id, params, callback)

## Author

* [Alexey Simonenko](mailto:alexey@simonenko.su), [simonenko.su](http://simonenko.su)

## License

The MIT License, see the included `license.md` file.
