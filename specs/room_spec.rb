require('minitest/autorun')
require_relative('../room')
require_relative('../guest')
require_relative('../song')

class TestRoom < MiniTest::Test
  def setup
    @room = Room.new('Number 5')
    @guest = Guest.new('Kate', 28, 'Halo', 40)
    @song = Song.new('Halo', 9)
  end

  def test_room_has_name
    assert_equal('Number 5', @room.name)
  end

  def test_room_has_capacity()
    assert_equal(10, @room.capacity)
  end

  def test_add_guest_to_room
    @room.add_guest_to_room(@guest)
    assert_equal(@guest, @room.guests[0])
  end

  def test_remove_guest_from_room
    @room.add_guest_to_room(@guest)
    @room.remove_guest_from_room(@guest)
    assert_equal(0, @room.guests.length)
  end

  def test_add_song_to_room
    @room.add_song_to_room(@song)
    assert_equal(@song, @room.catalogue[0])
  end
end
