require('minitest/autorun')
require_relative('../guest')
require_relative('../song')

class TestGuest < MiniTest::Test
  def setup
    @guest = Guest.new('Kate', 28, 'Halo', 20)
    @guest2 = Guest.new('Jim', 28, 'Umberella', 20)
    @catalogue = [Song.new('Halo', 11), Song.new('Umberella', 0)]
  end

  def test_guest_has_name
    assert_equal('Kate', @guest.name)
  end

  def test_pay
    @guest.pay(5)
    assert_equal(15, @guest.wallet)
  end

  def test_can_afford
    assert_equal(true, @guest.can_afford?(5))
  end

  def test_can_afford__cant
    assert_equal(false, @guest.can_afford?(45))
  end

  def test_find_favourite_song
    result = @guest.find_favourite_song(@catalogue)
    assert_equal('Wohoo!', result)
  end

  def test_assess_singing
    result = @guest.assess_singing(@guest2, @catalogue[1])
    assert_equal('Amazing, you are great!', result)
  end

  def test_asses_singing__too_hard
    result = @guest.assess_singing(@guest2, @catalogue[0])
    assert_equal('Oh wow, you suck', result)
  end
end
