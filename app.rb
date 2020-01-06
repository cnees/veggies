require 'rack'
require 'rack/handler/puma'

class App
  def call(env)
    response = {
      status: 200,
      headers: { "Content-Type" => "image/svg+xml" },
      body: body(env)
    }

    return [
      response[:status],
      response[:headers],
      response[:body]
    ]
  end

  def body(env)
    [
      '<svg xmlns="http://www.w3.org/2000/svg">',
        '<text x="20" y="30">Hello World</text>',
      '</svg>'
    ]
  end
end

Rack::Handler::Puma.run(App.new)
