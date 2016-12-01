#--
# Copyright 2016 by Anton Kozik (anton.kozik@gmail.com)
#--
# frozen_string_literal: true

require 'cuba'
require 'cuba/safe'
require 'cuba/render'
require 'tilt/erb'

Cuba.use Rack::Session::Cookie, secret: ENV['SECRET_COOKIE'] || 'type+in+very+long+secret+string'

Cuba.plugin Cuba::Safe
Cuba.plugin Cuba::Render

Cuba.define do
  on csrf.unsafe? do
    csrf.reset!
    res.status = 403
    res.write('Not authorized')
    halt(res.finish)
  end
  on get do
    on 'hello' do
      render('hello')
    end
    on root do
      res.redirect '/hello'
    end
  end
end
