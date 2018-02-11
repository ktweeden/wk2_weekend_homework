require('minitest/autorun')
require_relative('../song')

class TestGuest < MiniTest::Test
  def setup
    @song = Song.new('Halo', 9)
  end

  def test_song_has_title
    assert_equal('Halo', @song.title)
  end
end
