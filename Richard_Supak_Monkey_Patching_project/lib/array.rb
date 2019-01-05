# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    return if empty?

    max - min
  end

  def average
    return if empty?

    sum / size.to_f
  end

  def median
    return if empty?

    mid = size / 2
    sort!
    size.even? ? (self[mid - 1] + self[mid]) / 2.0 : self[mid]
  end

  def counts
    items = Hash.new(0)
    each { |key| items[key] += 1 }
    items
  end

  def my_count(value)
    num = 0
    each { |item| num += 1 if item == value }
    num
  end

  def my_index(value)
    return unless include?(value)

    each.with_index { |item, idx| return idx if item == value }
  end

  def my_uniq
    uniques = []
    each { |value| uniques << value unless uniques.include?(value) }
    uniques
  end

  def my_transpose
    temp = Array.new(size) { Array.new(size) }
    each_index do |row|
      each_index do |col|
        temp[col][row] = self[row][col]
      end
    end
    temp
  end
end
