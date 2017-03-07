require File.expand_path('../test_helper', __FILE__)


class SpotifyApiTest < Minitest::Test
  def setup
    skip("Need to mock the API call")
    @obj = SpotifyApi.new
    @artist = @obj.find_artist('Justin Bieber')
  end

  def test_find_artist
    assert_equal @artist.name, 'Justin Bieber'
  end

  def test_find_track
    track = @obj.find_track(@artist)
    assert_equal track.name, "Love Yourself"
  end
end
