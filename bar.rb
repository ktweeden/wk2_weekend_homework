require_relative('room')

class Bar
  attr_reader :name, :rooms, :waiting_list, :cash

  def initialize(name, number_of_rooms, cash)
    @name = name
    @rooms = []
    @waiting_list = []
    @till = cash
    @entry_fee = 5
    create_rooms(number_of_rooms)
  end

  def create_rooms(number_of_rooms)
    (1..number_of_rooms).each {|number| @rooms << Room.new("Room #{number}")}
  end

  def check_in_guest(guest)
    available_room = find_available_room(1)
      if available_room == nil
        @waiting_list << guest
      else
        add_guest_to_room_if_have_enough_money(guest, available_room)
      end
  end

  def check_in_multiple_guests(guest_array)
    available_room = find_available_room(guest_array.length)
    if available_room == nil
      guest_array.each {|guest| check_in_guest(guest)}
    else
      guest_array.each {|guest| add_guest_to_room_if_have_enough_money(guest, available_room)}
    end
  end

  def find_available_room(group_size)
    @rooms.find {|room| (room.capacity - room.guests.length) >= group_size}
  end

  def charge_guest(guest, amount)
    guest.pay(amount) if guest.can_afford?(amount)
  end

  def add_guest_to_room_if_have_enough_money(guest, room)
    room.add_guest_to_room(guest) if charge_guest(guest, @entry_fee) != nil
  end
end
