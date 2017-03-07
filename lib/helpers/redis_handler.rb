module RedisHandler
  include ArtistInfo

  def get_set_artist(name)
    unless cached_artist = $redis.get(name)
      artist = get_artist_info(name)
      $redis.set(name, artist.to_json)
      cached_artist = $redis.get(name)
    end
    JSON.parse(cached_artist)
  end
end

helpers RedisHandler
