require('minitest/autorun')
require_relative('../bar.rb')
require_relative('../guest')

class TestBar < MiniTest::Test

  def setup()
    @bar = Bar.new('Kool Kareoke', 5, 100)
    @medium_bar = Bar.new('Medium Melodies', 2, 75)
    @small_bar = Bar.new('Tiny Tunes', 1, 50)
    @guest = Guest.new('Kate', 28, 'Halo', 20)
    @guest_array = [
      Guest.new('Jim', 24, 'Pretty Woman', 15),
      Guest.new('Rachel', 18, 'Enter Sandman', 18),
      Guest.new('Alex', 26, 'Seven Nation Army', 20),
      Guest.new('Jussi', 24, 'Party in the USA', 77),
      Guest.new('Bob', 15, 'Believe', 10),
      Guest.new('Sarah', 38, 'Sinnerman', 30),
      Guest.new('Andy', 44, 'Free Falling', 20),
      Guest.new('Jack', 28, 'Never Going Back Again', 10),
      Guest.new('Emma', 23, 'Wannabe', 30),
      Guest.new('Harry', 32, 'Both Sides Now', 45)
    ]
  end

  def test_bar_has_name()
    assert_equal('Kool Kareoke', @bar.name())
  end

  def test_create_rooms()
    assert_equal(5, @bar.rooms().length())
  end

  def test_check_in_guest()
    @bar.check_in_guest(@guest)
    assert_equal(@guest, @bar.rooms[0].guests[0])
  end

  def test_check_in_guest__no_space()
    @small_bar.check_in_multiple_guests(@guest_array)
    @small_bar.check_in_guest(@guest)
    assert_equal(@guest, @small_bar.waiting_list()[0])
  end

  def test_check_in_multiple_guests()
    @bar.check_in_multiple_guests(@guest_array)
    assert_equal(@bar.rooms[0].guests.length, @guest_array.length)
  end

  def test_check_in_multiple_guests__no_space()
    @small_bar.check_in_multiple_guests(@guest_array)
    @small_bar.check_in_multiple_guests(@guest_array)
    assert_equal(10, @small_bar.waiting_list().length)
  end

  def test_check_in_multiple_guests__not_enough_space_in_one_room()
    @medium_bar.check_in_multiple_guests(@guest_array)
    @medium_bar.check_in_guest(@guest)
    @medium_bar.check_in_multiple_guests(@guest_array)
    assert_equal(1, @medium_bar.waiting_list().length)
  end

  def test_charge_guest()
    @bar.charge_guest(@guest, 5)
    assert_equal(15, @guest.wallet)
  end

  def test_charge_guest__not_enough_money()
    @bar.charge_guest(@guest, 30)
    assert_equal(20, @guest.wallet)
  end

end
