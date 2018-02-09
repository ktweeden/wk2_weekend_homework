require_relative('room')

class Bar
  attr_reader :name, :rooms, :waiting_list, :cash

  def initialize(name, number_of_rooms, cash)
    @name = name
    @rooms = []
    @waiting_list = []
    @till = cash
    create_rooms(number_of_rooms)
  end

  def create_rooms(number_of_rooms)
    (1..number_of_rooms).each() {|number| @rooms << Room.new("Room #{number}")}
  end

  def check_in_guest(guest)
    available_room = @rooms.find() {|room| room.guests().length < room.capacity}
      if available_room == nil
        @waiting_list << guest
      else
        available_room.add_guest_to_room(guest)
      end
  end

  def check_in_multiple_guests(guest_array)
    available_room = @rooms.find() do |room|
      (room.capacity - room.guests().length) >= guest_array.length()
    end
    if available_room == nil
      guest_array.each() {|guest| @waiting_list << guest}
    else
      guest_array.each() {|guest| available_room.add_guest_to_room(guest)}
    end
  end


end
