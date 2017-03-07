require File.expand_path('../test_helper', __FILE__)
require 'app'


class SpotifyApiTest < Minitest::Test
  def setup
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
