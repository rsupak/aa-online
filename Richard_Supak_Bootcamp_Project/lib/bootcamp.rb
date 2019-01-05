class Bootcamp
  attr_accessor :name, :slogan, :capacity, :teachers, :students

  def initialize(name, slogan, student_capacity)
    @name = name
    @slogan = slogan
    @student_capacity = student_capacity
    @teachers = []
    @students = []
    @grades = Hash.new { |hash, k| hash[k] = [] }
  end

  def hire(name)
    teachers << name
  end

  def enroll(name)
    return false if students.size >= @student_capacity

    students << name
    true
  end

  def enrolled?(name)
    students.include?(name)
  end

  def student_to_teacher_ratio
    students.size / teachers.size
  end

  def add_grade(name, grade)
    return false unless students.include?(name)

    @grades[name] << grade
    true
  end

  def num_grades(name)
    @grades[name].size
  end

  def average_grade(name)
    return if @grades[name].size.zero? || @grades[name].nil?

    @grades[name].reduce(&:+) / @grades[name].size
  end
end
