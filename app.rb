require 'cuba'
require 'json'
require 'pry'
require './models/book'

Cuba.define do

  res.headers['Content-Type'] = 'application/json'

  on 'books' do
    on ':id' do |id|
      on get do
        res.write Book[id].attributes.to_json
      end
      on put do
        Book[id].update JSON.parse(req.body.gets)
      end
      on delete do
        Book[id].delete
      end
    end
    on get do
      res.write Book.all.to_a.map { |book| book.attributes }.to_json
    end
    on post do
      Book.create JSON.parse(req.body.gets)
    end

  end

end
