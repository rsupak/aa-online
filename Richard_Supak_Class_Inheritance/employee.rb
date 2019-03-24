class Employee
  attr_reader :name, :title, :salary, :boss
  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    self.boss = boss
  end

  def boss=(boss)
    @boss = boss
    boss.add_employee(self) unless boss.nil?
  end

  def bonus(multiplier)
    @salary * multiplier
  end
end

class Manager < Employee
  attr_accessor :employees
  def initialize(name, title, salary, boss)
    super(name, title, salary, boss)
    @employees = []
  end

  def add_employee(subordinate)
    employees << subordinate
    subordinate
  end

  def bonus(multiplier)
    total_subsalary * multiplier
  end

  def total_subsalary
    total_subsalary = 0
    @employees.each do |employee|
      if employee.is_a?(Manager)
        total_subsalary += employee.salary + employee.total_subsalary
      else
        total_subsalary += employee.salary
      end
    end
    total_subsalary
  end
end

if $PROGRAM_NAME == __FILE__

  ned = Manager.new('Ned', 'Founder', 1_000_000, nil)
  darren = Manager.new('Darren', 'TA Manager', 78_000, ned)
  shawna = Employee.new('Shawna', 'TA', 12_000, darren)
  david = Employee.new('David', 'TA', 10_000, darren)

  p ned.bonus(5)
end
