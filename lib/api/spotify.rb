require 'rspotify'

class SpotifyApi
  def initialize
    RSpotify.authenticate(
      ENV['SPOTIFY_CLIENT_ID'], ENV['SPOTIFY_CLIENT_SECRET'])
  end

  def find_artist(first_last_name)
    RSpotify::Artist.search(first_last_name).first
  end

  def find_track(artist)
    artist&.top_tracks(:US)&.first
  end
end
