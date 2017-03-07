module ArtistInfo
  def get_artist_and_track(name)
    s = SpotifyApi.new
    artist = s.find_artist(name)
    track  = s.find_track(artist)
    {
      name: artist&.name,
      track: track&.name
    }
  end
end

helpers ArtistInfo
