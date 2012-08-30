require File.dirname(File.dirname(__FILE__)) + '/spec_helper'

CURRENT_DIR = Dir.getwd

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

describe 'Rack::Env' do
  include Rack::Test::Methods

  let(:request) { get '/' }

  before do
    # move current_dir to ./spec/tmp as root_dir
    Dir::chdir(File.dirname(File.dirname(__FILE__)) + '/tmp')
  end

  after(:all) do
    Dir::chdir(CURRENT_DIR)
  end

  context "When not using Rack::Env" do
    def app
      without_rack_env_app
    end

    it "should not load environment variable" do
      request
      expect(ENV['FOO']).to eq nil
    end
  end

  context "When using Rack::Env" do
    context "default envfile" do
      def app
        rack_env_app
      end

      it "should ignore empty line and commented out line" do
        expect{
          request
        }.to change{ ENV.size }.by(2)
      end

      it "should load environment variable" do
        request
        expect(ENV['JAPAN']).to eq "Tokyo"
      end
    end

    context "specified envfile" do
      def app
        rack_env_app_with_argument
      end

      it "should ignore empty line and commented out line" do
        expect{
          request
        }.to change{ ENV.size }.by(2)
      end

      it "should load environment variable" do
        request
        expect(ENV['INDIA']).to eq "Delhi"
      end
    end
  end
end
