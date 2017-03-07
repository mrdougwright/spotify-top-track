module ArtistInfo
  def get_artist_info(name)
    spotify = SpotifyApi.new
    artist  = spotify.find_artist(name)
    track   = spotify.find_track(artist)
    decorate_artist_data(artist, track)
  end

  def get_image_url(artist)
    images = artist&.images
    img = images&.select do |i|
      i['height'] >= 300 && i['height'] <= 400
    end.first
    img ? img['url'] : images&.first['url']
  end

  def decorate_artist_data(artist, track)
    {
      name: artist&.name,
      track: track&.name,
      image_url: get_image_url(artist),
      popularity: artist&.popularity,
      genres: artist&.genres || [],
      followers: artist&.followers['total'],
      related: artist&.related_artists&.map(&:name),
      spotify_link: artist&.external_urls['spotify']
    }
  end
end

helpers ArtistInfo
