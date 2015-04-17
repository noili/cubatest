require 'ohm'

class Person < Ohm::Model
  attribute :name

  def create name
    person = Person.create :name => name
  end
end

Person.create 'fede'

Person[1]
