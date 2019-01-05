require "employee"

class Startup
  attr_reader :name, :funding
  attr_accessor :employees, :salaries

  def initialize(name, funding, salaries)
    @name = name
    @funding = funding
    @salaries = salaries
    @employees = []
  end

  def valid_title?(title)
    @salaries.key?(title)
  end

  def >(other)
    @funding > other.funding
  end

  def hire(name, title)
    raise 'Invalid title' unless valid_title?(title)

    employees << Employee.new(name, title)
  end

  def size
    employees.size
  end

  def pay_employee(employee)
    raise 'Not enough funding' if @funding < salaries[employee.title]

    salary = @salaries[employee.title]
    @funding -= salary
    employee.pay(salary)
  end

  def payday
    employees.each { |employee| pay_employee(employee) }
  end

  def average_salary
    total_salary = 0
    employees.each do |employee|
      total_salary += @salaries[employee.title]
    end
    total_salary / size
  end

  def close
    @employees = []
    @funding = 0
  end

  def acquire(start_up)
    @funding += start_up.funding
    @salaries = start_up.salaries.merge(@salaries)
    @employees += start_up.employees
    start_up.close
  end
end
