# -*- encoding: utf-8 -*-

require "rack/env/version"

module Rack
  class Env
    def initialize(app, options = {})
      @app     = app
      @options = options
    end

    def call(env)
      set_env
      @app.call(env)
    end

    private
    def set_env
      if @options[:envfile]
        read_env_file(@options[:envfile])
      else
        read_env_file(default_env_file)
      end
    end

    def default_env_file
      ::File.join(Dir.getwd, '.env')
    end

    def read_env_file(envfile)
      ::File.readlines(envfile).each {|line|
        key, value = line.chomp.split('=')
        ENV[key] = value
      } if ::File.exist?(envfile)
    end
  end
end
