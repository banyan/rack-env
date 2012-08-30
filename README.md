# rack-env
[![Build Status](https://secure.travis-ci.org/banyan/rack-env.png)](http://travis-ci.org/banyan/rack-env)
[<img src="https://gemnasium.com/banyan/rack-env.png" />](https://gemnasium.com/banyan/rack-env)

Load environment variables from .env or specified file.

Some of the PaaS (such as [Heroku](http://www.heroku.com/) and [Sqale](http://sqale.jp)) are using configuration with .env.

This gem helps you while you are in development mode.

## Installation

Add this line to your application's Gemfile:

    gem 'rack-env'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rack-env

## Usage

### Rails

```ruby
group :development, :test do
  gem 'rack-env'
end
```

### Rack App (such as sinatra)

```ruby
# app.rb
require 'rack/env'
use Rack::Env
```

* Enable to specified file to load.

```ruby
# app.rb
require 'rack/env'
use Rack::Env, envfile: 'somewhere/to/.env.development'
```

* Use only local development

```ruby
# app.rb
require 'rack/env'
use Rack::Env unless ENV['RACK_ENV'] == 'production'
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


## Copyright

Copyright (c) 2012 Kohei Hasegawa. See LICENSE for details.
