require 'twilio-ruby'

class TwilioApi
  attr_reader :client

  def initialize
    @client = Twilio::REST::Client.new(
      ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
  end

# body = "#{artist.name}'s top track: #{track.name}"
  def send_message(from, to, body)
    client.account.messages.create({
      :from => from, :to => to,
      :body => body
      })
    puts "Texted #{to}"
  end
end
