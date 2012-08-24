# rack-env
[![Build Status](https://secure.travis-ci.org/banyan/rack-env.png)](http://travis-ci.org/banyan/rack-env)
[<img src="https://gemnasium.com/banyan/rack-env.png" />](https://gemnasium.com/banyan/rack-env)

Sets .env variables (`ENV['KEY']` pattern).

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

```
require 'rack/env'
```

### Rails

```
group :development, :test do
  gem 'rack-env'
end
```

### Rack

```
# config.ru
Rack::Builder.new
  use Rack::Env if ENV['RACK_ENV'] == 'development'
  run MyApplication.new
end
```

* Enable to change .env path like as below.

```
# config.ru
Rack::Builder.new
  use Rack::Env, envfile: '.env.development' if ENV['RACK_ENV'] == 'development'
  run MyApplication.new
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
