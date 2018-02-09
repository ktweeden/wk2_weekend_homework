require('minitest/autorun')
require_relative('../guest')

class TestGuest < MiniTest::Test
  def setup()
    @guest = Guest.new('Kate', 28, 'Halo', 20)
  end

  def test_guest_has_name()
    assert_equal('Kate', @guest.name())
  end
end
