class Dog
  attr_accessor :name, :breed, :age, :favorite_foods

  def initialize(name, breed, age, bark, favorite_foods)
    @name = name
    @breed = breed
    @age = age
    @bark = bark
    @favorite_foods = favorite_foods
  end

  def bark
    age > 3 ? @bark.upcase : @bark.downcase
  end

  def favorite_food?(food)
    favorite_foods.include?(food.capitalize)
  end
end
