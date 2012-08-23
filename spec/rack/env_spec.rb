require File.dirname(File.dirname(__FILE__)) + '/spec_helper'

current_dir = Dir.getwd

describe 'Rack::Env' do
  include Rack::Test::Methods

  before do
    # move current_dir as ./spec
    Dir::chdir(File.dirname(File.dirname(__FILE__)) + '/tmp')
  end

  after(:all) do
    Dir::chdir(current_dir)
  end

  def without_rack_env_app
    Rack::Builder.new do
      run TestRackApp.new
    end
  end

  def rack_env_app
    Rack::Builder.new do
      use Rack::Env
      run TestRackApp.new
    end
  end

  def rack_env_app_with_argument
    Rack::Builder.new do
      use Rack::Env, envfile: ".envfile"
      run TestRackApp.new
    end
  end

  context "When not using Rack::Env" do
    def app
      without_rack_env_app
    end

    it "should ENV['FOO'] is nil" do
      get '/'
      expect(ENV['FOO']).to eq nil
    end
  end

  context "When using Rack::Env" do
    context "without argument" do
      def app
        rack_env_app
      end

      it "should ENV['FOO'] == 'bar'" do
        get '/'
        expect(ENV['FOO']).to eq "bar"
      end
    end

    context "with argument" do
      def app
        rack_env_app_with_argument
      end

      it "should ENV['BAZ'] == 'qux'" do
        get '/'
        expect(ENV['BAZ']).to eq "qux"
      end
    end
  end
end
