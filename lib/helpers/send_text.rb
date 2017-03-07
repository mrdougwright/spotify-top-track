module SendText
  def send_text_message(artist_name, artist_track, phone)
    t = TwilioApi.new
    body = "#{artist_name}'s top track: #{artist_track}"
    t.send_message(phone, body)
  end
end

helpers SendText
