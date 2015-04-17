require 'cuba/test'
require './hello_world'

scope do
  test 'Homepage' do
    get '/hello'
    assert last_response.body == 'Hello world'
  end
end
