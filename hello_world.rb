require 'cuba'
require 'ohm'
require './models/person'

Cuba.define do
  on get do
    on 'hello' do
      res.write 'Hello world'
    end
    on 'chau' do
      res.write 'chau'
    end
  end
end
