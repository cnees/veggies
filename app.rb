require 'pry'

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
      "<svg xmlns='http://www.w3.org/2000/svg'>",
      "<text x='20' y='30'>Referer: #{env['HTTP_REFERER']}</text>",
      "<text x='20' y='60'>Referer: #{env['REMOTE_ADDR']}</text>",
      "</svg>"
    ]
  end
end
