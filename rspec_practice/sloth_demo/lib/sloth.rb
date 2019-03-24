class Sloth
  attr_reader :name, :foods, :drinks
  DIRECTIONS = %w[north south east west]

  def initialize(name)
    @name = name
    @foods = []
    @drinks = {}
  end

  def eat(food)
    @foods << food
  end

  def drink(beverage, amount)
    @drinks[beverage] = amount
  end

  def run(direction)
    raise ArgumentError unless DIRECTIONS.include?(direction)
    "I'm running #{direction} at .00001 miles per hour"
  end

  protected
  def secret_sloth
    'Shhh...this is a secret.'
  end
end
