$:.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$:.unshift(File.dirname(__FILE__))

%w(rack rack/test rack/env rspec).each {|f| require f }

class TestRackApp
  def call(env)
    [200, {"Content-Type" => "text/html"}, ["hi"]]
  end
end
