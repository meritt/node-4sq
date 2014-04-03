# 4sq

[![NPM version](https://badge.fury.io/js/4sq.svg)](http://badge.fury.io/js/4sq) [![Dependency Status](https://david-dm.org/meritt/node-4sq.svg?theme=shields.io)](https://david-dm.org/meritt/node-4sq)

A node.js wrapper for the [Foursquare API](https://developer.foursquare.com/overview/).

## Installation

```bash
$ npm install 4sq
```

## Examples

```js
var Foursquare = require('4sq');

var fsq = new Foursquare({
  token: 'OAuth2 access_token'
});

fsq.checkins('self', {limit: 5}, function(error, data) {
  if (error) {
    throw new Error(error);
  }

  console.log(data);
});
```

```coffeescript
Foursquare = require '4sq'

fsq = new Foursquare token: 'OAuth2 access_token'

fsq.checkins 'self', limit: 5, (error, data) ->
  throw new Error error if error
  console.log data
```

## How to retrieve foursquare OAuth2 access_token

Grab latest source code and install all dev dependencies

```bash
$ npm link
```

Change your host, client id, client secret in [examples/get-access-token.coffee](http://github.com/meritt/node-4sq/blob/master/examples/get-access-token.coffee) and after that run [examples/get-access-token.coffee](http://github.com/meritt/node-4sq/blob/master/examples/get-access-token.coffee)

```bash
$ coffee examples/get-access-token.coffee
```

## API

* `user(user_id[, params], callback)`
* `checkins(user_id[, params], callback)`
* `badges(user_id[, params], callback)`

By default `user_id` set to `self`.

## Author

* [Alexey Simonenko](mailto:alexey@simonenko.su), [simonenko.su](http://simonenko.su)

## License

The MIT License, see the included `license.md` file.

[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/meritt/node-4sq/trend.png)](https://bitdeli.com/free "Bitdeli Badge")