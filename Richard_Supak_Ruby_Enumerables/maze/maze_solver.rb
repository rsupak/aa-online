require_relative 'maze'

class Maze_Solver
  def initialize(maze)
    @maze = maze
    reset_values
  end

  def find_distance(point)
    point_x, point_y = point
    final_x, final_y = @maze.find_finish
    ((point_x - final_x) + (point_y - final_y)).abs
  end

  def find_manhattan_estimate(point)
    dist_to_end = find_distance(point)
    dist_traveled = find_path(point).length
    f = dist_to_end + dist_traveled
  end

  def manhattan_heuristic(queue)
    queue.inject do |chosen_point, point|
      old_f = find_manhattan_estimate(chosen_point)
      new_f = find_manhattan_estimate(point)
      old_f > new_f ? point : chosen_point
    end
  end

  def building_branching_paths(heuristic = :manhattan_heuristic)
    reset_values
    queue = [@current]
    visited = [@current]

    until queue.empty? || @current == @maze.find_finish
      @current = send(heuristic, queue)
      queue.delete(@current)
      visited << @current
      nearby_openings = @maze.find_neighbors(@current)
      nearby_openings.each do |neighbors|
        unless visited.include?(neighbors) || queue.include?(neighbors)
          queue << neighbors
          @branching_paths[neighbors] = @current
        end
      end
    end

    @branching_paths
  end

  def find_path(goal = @maze.find_finish)
    path = [goal]
    spot = goal
    until @branching_paths[spot].nil?
      path << @branching_paths[spot]
      spot = @branching_paths[spot]
    end
    path
  end

  def solve(heuristic = :manhattan_heuristic)
    building_branching_paths(heuristic)
    path = find_path
    @maze.travel_path(path)
  end

  private

  def reset_values
    @branching_paths = {}
    @current = @maze.find_start
  end
end

if $PROGRAM_NAME == __FILE__
  filename = ARGV[0] || 'maze1.txt'
  test_maze = Maze.new(filename)
  puts test_maze
  puts "Start is at #{test_maze.start}"
  puts "Finish is at #{test_maze.finish}"
  test_solver = Maze_Solver.new(test_maze)
  test_solver.solve
end
