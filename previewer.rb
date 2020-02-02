require 'rack/handler/puma'

class Previewer
  def call(env)
    return [
      200,
      { "Content-Type" => "text/html" },
      ["<img src='http://localhost:9292'>"]
    ]
  end
end

Rack::Handler::Puma.run(Previewer.new, Port: 9291)
