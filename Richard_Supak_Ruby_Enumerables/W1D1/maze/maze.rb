class Maze
  DELTAS = [[1, 0], [0, 1], [-1, 0], [0, -1]]

  attr_reader :start_point, :end_point
  def initialize(filename)
    @map = load_map(filename)
    @title = parse_title(filename)
    @start_point = find_start
    @end_point = find_finish
  end

  def load_map(filename)
    maze = []
    File.open(filename).each_line do |line|
      chars = line.split('')
      maze << chars
    end
  end
end
