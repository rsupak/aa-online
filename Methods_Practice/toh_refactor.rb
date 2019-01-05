# Write a Towers of Hanoi game.

# Keep three arrays, which represents the piles of discs. Pick a representation
# of the discs to store in the arrays; maybe just a number representing their
# size.

# In a loop, prompt the user (using gets) and ask what pile to select a disc
# from, and where to put it.

# After each move, check to see if they have succeeded in moving all the discs,
# to the final pile. If so, they win!
class Hanoi
  attr_accessor :stacks

  def initialize
    disks = (1..3).to_a.reverse
    @stacks = [disks, [], []]
  end

  def hanoi
    until over?
      puts display
      from_stack_num = get_stack('Move from: ')
      to_stack_num = get_stack('Move to: ')
      move_disk(from_stack_num, to_stack_num)
    end
    puts display
    puts 'You did it!'
  end

  private

  def display
    max_height = stacks.map(&:count).max
    render_string = (max_height - 1).downto(0).map do |height|
      stacks.map do |stack|
        stack[height] || ' '
      end.join("\t")
    end.join("\n")
    puts render_string
    "a\tb\tc"
  end

  def over?
    stacks[0].empty? && stacks[1..2].any?(&:empty?)
  end

  def get_stack(prompt)
    move_hash = { 'a' => 0, 'b' => 1, 'c' => 2 }
    loop do
      print prompt
      stack_num = move_hash[gets.chomp]
      return stack_num unless stack_num.nil?

      puts 'Invalid Move!'
    end
  end

  def move_disk(from_stack_num, to_stack_num)
    from_stack, to_stack = @stacks.values_at(from_stack_num, to_stack_num)
    raise 'cannot move from empty stack' if from_stack.empty?
    unless to_stack.empty? || to_stack.last > from_stack.last
      raise 'cannot move onto smaller disk'
    end

    to_stack << from_stack.pop
  end
end
h = Hanoi.new
h.hanoi
