require 'byebug'

# EASY

# Define a method that returns the sum of all the elements in its argument (an
# array of numbers).
def array_sum(arr)
  return 0 if arr.empty?

  arr.reduce(&:+)
end

# Define a method that returns a boolean indicating whether substring is a
# substring of each string in the long_strings array.
# Hint: you may want a sub_tring? helper method
def in_all_strings?(long_strings, substring)
  long_strings.map do |str|
    str.split.any?(substring)
  end.all?(true)
end

# Define a method that accepts a string of lower case words (no punctuation) and
# returns an array of letters that occur more than once, sorted alphabetically.
def non_unique_letters(string)
  arr = string.split.join.split('')
  arr.select { |c| c if arr.count(c) > 1 }.uniq.sort
end

# Define a method that returns an array of the longest two words (in order) in
# the method's argument. Ignore punctuation!
def longest_two_words(string)
  arr = string.split.sort_by(&:length)
  [arr[-1], arr[-2]]
end

# MEDIUM

# Define a method that takes a string of lower-case letters and returns an array
# of all the letters that do not occur in the method's argument.
def missing_letters(string)
  letters = %w[a b c d e f g h i j k l m n o p q r s t u v w x y z]
  letters.select { |c| c unless string.include?(c) }
end

# Define a method that accepts two years and returns an array of the years
# within that range (inclusive) that have no repeated digits. Hint: helper
# method?
def no_repeat_years(first_yr, last_yr)
  (first_yr..last_yr).select { |year| not_repeat_year?(year) }
end

def not_repeat_year?(year)
  year_digits = year.to_s.chars
  year_digits == year_digits.uniq
end

# HARD

# Define a method that, given an array of songs at the top of the charts,
# returns the songs that only stayed on the chart for a week at a time. Each
# element corresponds to a song at the top of the charts for one particular
# week. Songs CAN reappear on the chart, but if they don't appear in consecutive
# weeks, they're "one-week wonders." Suggested strategy: find the songs that
# appear multiple times in a row and remove them. You may wish to write a helper
# method no_repeats?
def one_week_wonders(songs)
  songs.select { |song| no_repeats?(song, songs) }.uniq
end

def no_repeats?(song_name, songs)
  songs.each_index do |i|
    if songs[i] == song_name
      return false if songs[i + 1] == song_name
    end
  end
end

# Define a method that, given a string of words, returns the word that has the
# letter "c" closest to the end of it. If there's a tie, return the earlier
# word. Ignore punctuation. If there's no "c", return an empty string. You may
# wish to write the helper methods c_distance and remove_punctuation.

def for_cs_sake(string)
  c_words = Hash.new(0)
  string = remove_punctuation(string)
  string.split(' ').each do |word|
    c_words[word] = c_distance(word) if word.include?('c')
  end
  p c_words
  c_words.min_by { |v| v }.first
end

def c_distance(word)
  word.reverse.chars.each.with_index do |obj, i|
    return i if obj == 'c'
  end
end

def remove_punctuation(string)
  string.delete('.!,?')
end

# Define a method that, given an array of numbers, returns a nested array of
# two-element arrays that each contain the start and end indices of whenever a
# number appears multiple times in a row. repeated_number_ranges([1, 1, 2]) =>
# [[0, 1]] repeated_number_ranges([1, 2, 3, 3, 4, 4, 4]) => [[2, 3], [4, 6]]

def repeated_number_ranges(arr)
  ranges = []
  start = nil
  arr.each.with_index do |num, i|
    next_num = arr[i + 1]
    if num == next_num
      start ||= i
    elsif start
      ranges << [start, i]
      start = nil
    end
  end
  ranges
end
