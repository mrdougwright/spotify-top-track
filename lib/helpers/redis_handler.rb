module RedisHandler
  def get_set_artist(name)
    if cached_artist = $redis.get(name)
      artist = JSON.parse(cached_artist)
    else
      artist = get_artist_info(name)
      $redis.set(name, artist.to_json)
    end
    artist
  end
end

helpers RedisHandler
