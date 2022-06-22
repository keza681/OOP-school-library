$LOAD_PATH << '.'
require 'person'
require 'classroom'

class Student < Person

  def initialize(age, name = 'Unknown',
                 # rubocop:todo Lint/UnusedMethodArgument
                 classroom = Classroom.new('default_classroom'), parent_permission: true, id: nil)
    # rubocop:enable Lint/UnusedMethodArgument
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
    @classroom.students.push(self) unless @classroom.students.include?(self)
  end

  attr_reader :classroom

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def to_hash
    hash = {}
    hash[:class] = self.class
    hash[:age] = @age
    hash[:name] = @name
    hash[:parent_permission] = @parent_permission
    hash[:id] = @id
    hash
  end

  def self.create_from_hash(hash)
    Student.new(hash['age'], hash['name'], parent_permission: hash['parent_permission'], id: hash['id'])
  end
end
