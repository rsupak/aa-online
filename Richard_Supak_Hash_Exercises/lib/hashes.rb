# EASY

# Define a method that, given a sentence, returns a hash of each of the words as
# keys with their lengths as values. Assume the argument lacks punctuation.
def word_lengths(str)
  hsh = {}
  str.split(' ').each { |k| hsh[k] = k.length }
  hsh
end

# Define a method that, given a hash with integers as values, returns the key
# with the largest value.
def greatest_key_by_val(hash)
  hash.each do |k, v|
    max = hash.values.max
    return k if v == max
  end
end

# Define a method that accepts two hashes as arguments: an older inventory and a
# newer one. The method should update keys in the older inventory with values
# from the newer one as well as add new key-value pairs to the older inventory.
# The method should return the older inventory as a result. march = {rubies: 10,
# emeralds: 14, diamonds: 2} april = {emeralds: 27, moonstones: 5}
# update_inventory(march, april) => {rubies: 10, emeralds: 27, diamonds: 2,
# moonstones: 5}
def update_inventory(older, newer)
  newer.keys.each { |k| older[k] = newer[k] }
  older
end

# Define a method that, given a word, returns a hash with the letters in the
# word as keys and the frequencies of the letters as values.
def letter_counts(word)
  count = Hash.new(0)
  word.each_char { |char| count[char] += 1}
  count
end

# MEDIUM

# Define a method that, given an array, returns that array without duplicates.
# Use a hash! Don't use the uniq method.
def my_uniq(arr)
  hash = {}
  arr.each { |obj| hash[obj] = true }
  hash.keys
end

# Define a method that, given an array of numbers, returns a hash with "even"
# and "odd" as keys and the frequency of each parity as values.
def evens_and_odds(numbers)
  hash = Hash.new(0)
  numbers.each { |num| (num % 2).zero? ? hash[:even] += 1 : hash[:odd] += 1 }
  hash
end

# Define a method that, given a string, returns the most common vowel. Do
# not worry about ordering in the case of a tie. Assume all letters are 
# lower case.
def most_common_vowel(string)
  hash = Hash.new(0)
  vowels = 'aeiou'
  string.each_char do |char|
    hash[char] += 1 if vowels.include?(char)
  end
  hash.keys.sort.each do |k|
    return k if hash[k] == hash.values.max
  end
end

# HARD

# Define a method that, given a hash with keys as student names and values as
# their birthday months (numerically, e.g., 1 corresponds to January), returns
# every combination of students whose birthdays fall in the second half of the
# year (months 7-12). students_with_birthdays = { "Asher" => 6, "Bertie" => 11,
# "Dottie" => 8, "Warren" => 9 }
# fall_and_winter_birthdays(students_with_birthdays) => [ ["Bertie", "Dottie"],
# ["Bertie", "Warren"], ["Dottie", "Warren"] ]
def fall_and_winter_birthdays(students)
  results = []
  students = students.select { |_student, month| month >= 7 }
  students.keys.each do |name1|
    students.keys.each do |name2|
      unless results.include?([name1, name2].sort) || name1 == name2
        results << [name1, name2].sort
      end
    end
  end
  results
end

# Define a method that, given an array of specimens, returns the biodiversity
# index as defined by the following formula: number_of_species**2 *
# smallest_population_size / largest_population_size biodiversity_index(["cat",
# "cat", "cat"]) => 1 biodiversity_index(["cat", "leopard-spotted ferret",
# "dog"]) => 9
def biodiversity_index(specimens)
  uniques = specimens.uniq
  species_count = {}

  specimens.each do |species|
    species_count[species] = specimens.count(species)
  end

  calculate_index(uniques, species_count)
end

def calculate_index(uniques, species_count)
  number_of_species = uniques.length
  smallest_population_size = species_count.values.min
  largest_population_size = species_count.values.max

  number_of_species**2 * smallest_population_size / largest_population_size
end

# Define a method that, given the string of a respectable business sign, returns
# a boolean indicating whether pranksters can make a given vandalized string
# using the available letters. Ignore capitalization and punctuation.
# can_tweak_sign("We're having a yellow ferret sale for a good cause over at the
# pet shop!", "Leopard ferrets forever yo") => true
def can_tweak_sign?(normal_sign, vandalized_sign)
  str = normal_sign.delete ",.!?';".downcase
  letters = character_count(str)
  vandalized_sign.each_char do |char|
    char = char.downcase
    return false if letters[char].nil? || letters[char].zero?

    letters[char] -= 1
  end
  true
end

def character_count(str)
  count = {}
  str.each_char { |c| count[c] = str.count(c) }
  count
end
