require_relative "room"

class Hotel
  attr_accessor :rooms
  def initialize(name, rooms)
    @name = name
    @rooms = rooms.each { |k, v| rooms[k] = Room.new(v) }
  end

  def name
    @name.split.map(&:capitalize).join(' ')
  end

  def room_exists?(room_name)
    rooms.key?(room_name)
  end

  def check_in(person, room_name)
    if room_exists?(room_name)
      if rooms[room_name].full?
        puts 'sorry, room is full'
      else
        rooms[room_name].add_occupant(person) unless rooms[room_name].full?
        puts 'check in successful'
      end
    else
      puts 'sorry, room does not exist'
    end
  end

  def has_vacancy?
    vacant = false
    rooms.values.each do |room|
      vacant = true unless room.full?
    end
    vacant
  end

  def list_rooms
    rooms.each { |k, v| puts "#{k} : #{v.available_space}" }
  end
end
