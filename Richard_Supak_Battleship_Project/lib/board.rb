class Board
  attr_reader :size, :grid

  def initialize(num)
    @grid = Array.new(num) { Array.new(num) { :N } }
    @size = num**2
  end

  def [](pos)
    row, col = pos
    grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    grid[row][col] = value
  end

  def num_ships
    grid.flatten.select { |el| el == :S }.length
  end

  def attack(pos)
    if self[pos] == :S
      self[pos] = :H
      puts 'You sunk my battleship!'
      true
    else
      self[pos] = :X
      puts 'Miss!'
      false
    end
  end

  def place_random_ships
    ships = size / 4
    len = Math.sqrt(size).to_i
    while ships > 0
      random_pos = [rand(len), rand(len)]
      if self[random_pos] == :N
        self[random_pos] = :S
        ships -= 1
      end
    end
  end

  def hidden_ships_grid
    grid.map { |row| row.map { |el| el == :S ? :N : el } }
  end

  def self.print_grid(array)
    array.each do |row|
      puts row.join(' ')
    end
  end

  def cheat
    Board.print_grid(grid)
  end

  def print
    Board.print_grid(hidden_ships_grid)
  end
end
