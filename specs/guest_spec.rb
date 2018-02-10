require('minitest/autorun')
require_relative('../guest')

class TestGuest < MiniTest::Test
  def setup()
    @guest = Guest.new('Kate', 28, 'Halo', 20)
  end

  def test_guest_has_name()
    assert_equal('Kate', @guest.name())
  end

  def test_pay()
    @guest.pay(5)
    assert_equal(15, @guest.wallet())
  end

  def test_can_afford()
    assert_equal(true, @guest.can_afford?(5))
  end

  def test_can_afford__cant()
    assert_equal(false, @guest.can_afford?(45))
  end
end
