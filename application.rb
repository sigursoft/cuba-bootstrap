# frozen_string_literal: true

require 'cuba'
require 'cuba/safe'

Cuba.use Rack::Session::Cookie, :secret => ENV['SECRET'] || 'type+in+very+long+secret+string'

Cuba.plugin Cuba::Safe

Cuba.define do
  on get do
    on 'hello' do
      res.write 'Simple answer!'
    end
    on root do
      res.redirect '/hello'
    end
  end
end