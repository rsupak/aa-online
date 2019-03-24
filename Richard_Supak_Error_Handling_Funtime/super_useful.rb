# PHASE 2
def convert_to_int(str)
  Integer(str)
rescue ArgumentError
  puts "#{str} is cannot be converted into an Integer."
end

# PHASE 3
FRUITS = %w[apple banana orange].freeze

class CoffeeError < StandardError
end

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit == 'coffee'
    raise CoffeeError, 'Mmmm...COFFEE!!! May a fruit next time, yeah? :)'
  else
    raise StandardError
  end
end

def feed_me_a_fruit
  puts 'Hello, I am a friendly monster. :)'
  puts 'Feed me a fruit! (Enter the name of a fruit:)'
  maybe_fruit = gets.chomp
  reaction(maybe_fruit)
rescue CoffeeError => e
  puts e
  retry
rescue StandardError
  puts "That's not a fruit! :("
end

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    raise ArgumentError, 'Name must be given' if name.length <= 0
    raise ArgumentError, 'Years known less than 5' unless yrs_known >= 5
    raise ArgumentError, 'No favorite pastime given' if fav_pastime.length <= 0

    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


