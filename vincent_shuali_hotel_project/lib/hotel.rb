require_relative "room"

class Hotel

    attr_reader :rooms
    def initialize(name, hash)
        @name = name
        @rooms = Hash.new

        # hash.each_pair do |k, v|
        #     @rooms[k] = Room.new(v)
        # end

        @rooms = hash.map {|k, v| [k, Room.new(v)]}.to_h
    end

    def room_exists?(roomname)
        !!@rooms[roomname]
    end

    def check_in(personname, roomname)
        if !self.room_exists?(roomname)
            puts "sorry, room does not exist"
        else
            if @rooms[roomname].add_occupant(personname)
                puts "check in successful"
            else
                puts "sorry, room is full"
            end
        end

    end

    def name
        @name.split.map {|word| word.capitalize}.join(' ')
    end

    def has_vacancy?
        @rooms.any? {|k, v| v.available_space > 0}
    end

    def list_rooms
        @rooms.each_pair do |k, v|
            puts "#{k}    Spaces Available: #{v.available_space}"   # new line character not needed
        end
    end
  
end
