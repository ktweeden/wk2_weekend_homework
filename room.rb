class Room

  attr_reader :name, :guests, :capacity, :catalogue

  def initialize(name)
    @name = name
    @guests = []
    @capacity = 10
    @song_queue = []
    @catalogue = []
  end

  def add_guest_to_room(guest)
    @guests << guest
    guest.find_favourite_song(@catalogue)
  end

  def remove_guest_from_room(guest)
    @guests.delete(guest)
  end

  def add_song_to_room(song)
    @catalogue << song
  end

end
