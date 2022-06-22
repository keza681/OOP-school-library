require_relative '../decorator'
require_relative '../nameable'
require_relative '../person'

describe Decorator do
  context 'Given a nameable' do
    it 'creates a Decorator with the correct parameters' do
      nameable = Nameable.new

      decorator = Decorator.new(nameable)

      expect(decorator.nameable).to equal(nameable)
    end

    it 'can write a new nameable to the @nameable field' do
      nameable = Nameable.new
      new_nameable = Nameable.new

      decorator = Decorator.new(nameable)
      decorator.nameable = new_nameable

      expect(decorator.nameable).to equal(new_nameable)
    end
  end

  context 'Given a person' do
    it 'return the name of the person' do
      person = Person.new(13, 'Tarik')

      decorator = Decorator.new(person)

      expect(decorator.correct_name).to equal(person.correct_name)
    end
  end
end
