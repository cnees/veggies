# Run with `bundle exec puma`
# `config.ru` is Puma's default configuration file

require 'rack/handler/puma'
require './app'
require 'active_record'

ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || 'postgres://localhost/veggie')
Rack::Handler::Puma.run(App.new)
