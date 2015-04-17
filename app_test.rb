require 'cuba/test'
require './app'

Ohm.flush
Book.create title: 'shapping things'

scope do
  test 'get all books' do
    get '/books'
    assert JSON.parse(last_response.body).is_a? Array
  end

  test 'get book by id' do
    get '/books/1'
    assert JSON.parse(last_response.body)['title'] == 'shapping things'
  end

  test 'create new book' do
    count = Book.all.count
    post '/books', { "title" => "cuentos cortos" }.to_json
    assert Book.all.count == count + 1
  end

  test 'update book' do
    put '/books/1', { "title" => "cuentos largos" }.to_json
    assert Book[1].attributes[:title] == 'cuentos largos'
  end

  test 'delete book' do
    delete 'books/1'
    assert !Book[1]
  end
end
