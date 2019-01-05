class Employee
  attr_reader :name, :title
  attr_writer :earnings

  def initialize(name, title)
    @name = name
    @title = title
    @earnings = 0
  end

  def pay(amount)
    @earnings += amount
  end
end
